#include <ffi.h>
#include <stdint.h>

#include "HsFFI.h"
#include "janet.h"

/*
 * Turns a Haskell closure into a genuine JanetCFunction (`Janet (*)(int32_t,
 * Janet*)`), one per registration, with no fixed limit.
 *
 * Two problems stood in the way of the obvious `foreign import ccall
 * "wrapper"` approach:
 *
 *  - Janet's native function type returns `Janet` (a 16-byte struct) by
 *    value, and GHC's own FFI trampoline generator can't produce code that
 *    does that - only libffi (or a real C compiler) can.
 *  - JanetCFunction has no userdata slot, so distinguishing between
 *    registrations needs a distinct C function address per registration,
 *    not shared dispatch through one entry point.
 *
 * libffi's closure API solves both at once: `ffi_prep_closure_loc` builds a
 * fresh trampoline, described by an `ffi_cif` we control (so it implements
 * the *real* by-value-struct-return ABI, not an approximation), and bakes
 * an arbitrary `user_data` pointer into it. We use a StablePtr to the
 * Haskell closure as that userdata, so each closure is entirely
 * independent - no shared table, no count to exhaust.
 */

_Static_assert(
    sizeof(Janet) == 16,
    "Janet's layout changed size; the ffi_type description below needs "
    "reconsidering to match"
);

/* Defined in Janet.Register via `foreign export`. */
extern void janet_hs_dispatch(HsStablePtr sp, int32_t argc, Janet *argv, Janet *out);

static void janet_hs_ffi_handler(ffi_cif *cif, void *ret, void **args, void *user_data) {
    (void)cif;
    int32_t argc = *(int32_t *)args[0];
    Janet *argv = *(Janet **)args[1];
    janet_hs_dispatch((HsStablePtr)user_data, argc, argv, (Janet *)ret);
}

/*
 * Janet is `{ union { uint64_t; double; int32_t; void*; const void*; } as;
 * JanetType type; }` - an 8-byte union followed by a 4-byte enum. For ABI
 * classification purposes the union's member choice here (uint64) isn't
 * arbitrary: on every ABI this project targets (x86-64 SysV, AArch64
 * AAPCS64/Apple), a union with a pointer/integer member overlapping a
 * float member at the same offset is classified as an integer/
 * general-purpose value, never as a float - so describing that eightbyte
 * as uint64, not double, reproduces the real calling convention a C
 * compiler would use. This has been verified on aarch64-darwin; it has not
 * been tested on other architectures the flake happens to expose.
 */
static ffi_type *janet_hs_struct_elements[] = {
    &ffi_type_uint64,
    &ffi_type_uint32,
    NULL,
};

static ffi_type janet_hs_ffi_type = {
    .size = 0,
    .alignment = 0,
    .type = FFI_TYPE_STRUCT,
    .elements = janet_hs_struct_elements,
};

static ffi_type *janet_hs_arg_types[2];
static ffi_cif janet_hs_cif;

__attribute__((constructor)) static void janet_hs_init_cif(void) {
    janet_hs_arg_types[0] = &ffi_type_sint32;
    janet_hs_arg_types[1] = &ffi_type_pointer;
    /* Runs once, before any Haskell code can call janet_hs_make_closure,
     * so there's no need to guard this against concurrent first use. */
    ffi_prep_cif(&janet_hs_cif, FFI_DEFAULT_ABI, 2, &janet_hs_ffi_type, janet_hs_arg_types);
}

JanetCFunction janet_hs_make_closure(HsStablePtr sp) {
    void *code;
    ffi_closure *closure = ffi_closure_alloc(sizeof(ffi_closure), &code);
    if (closure == NULL) {
        return NULL;
    }
    if (ffi_prep_closure_loc(closure, &janet_hs_cif, janet_hs_ffi_handler, sp, code) != FFI_OK) {
        ffi_closure_free(closure);
        return NULL;
    }
    return (JanetCFunction)code;
}
