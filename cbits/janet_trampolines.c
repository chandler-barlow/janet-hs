#include <stdint.h>
#include "janet.h"

/*
 * Bridges two constraints:
 *
 *  - JanetCFunction (`Janet (*)(int32_t argc, Janet *argv)`) has no
 *    userdata slot, so distinguishing between N registered Haskell
 *    functions needs N distinct C function addresses, not one shared
 *    entry point.
 *  - GHC's `foreign import ccall "wrapper"` can generate any number of
 *    those distinct addresses, but only for signatures built from
 *    FFI-primitive types; it cannot generate one that returns a `Janet`
 *    struct by value.
 *
 * So each slot's real Haskell closure is wrapped with an out-pointer
 * signature GHC can marshal (`void (*)(int32_t, Janet *, Janet *)`), and
 * this file supplies the one thing GHC can't: a fixed pool of trampolines
 * with the exact by-value-return signature Janet's VM expects, each
 * hardcoded to call one numbered slot and return what it wrote.
 */

#define JANET_HS_NUM_SLOTS 16

typedef void (*JanetHsSlotFn)(int32_t argc, Janet *argv, Janet *out);

static JanetHsSlotFn janet_hs_slots[JANET_HS_NUM_SLOTS];

void janet_hs_set_slot(int32_t slot, JanetHsSlotFn fn) {
    janet_hs_slots[slot] = fn;
}

#define JANET_HS_TRAMPOLINE(N)                                        \
    static Janet janet_hs_trampoline_##N(int32_t argc, Janet *argv) { \
        Janet out;                                                    \
        janet_hs_slots[N](argc, argv, &out);                          \
        return out;                                                   \
    }

JANET_HS_TRAMPOLINE(0)
JANET_HS_TRAMPOLINE(1)
JANET_HS_TRAMPOLINE(2)
JANET_HS_TRAMPOLINE(3)
JANET_HS_TRAMPOLINE(4)
JANET_HS_TRAMPOLINE(5)
JANET_HS_TRAMPOLINE(6)
JANET_HS_TRAMPOLINE(7)
JANET_HS_TRAMPOLINE(8)
JANET_HS_TRAMPOLINE(9)
JANET_HS_TRAMPOLINE(10)
JANET_HS_TRAMPOLINE(11)
JANET_HS_TRAMPOLINE(12)
JANET_HS_TRAMPOLINE(13)
JANET_HS_TRAMPOLINE(14)
JANET_HS_TRAMPOLINE(15)

JanetCFunction janet_hs_trampolines[JANET_HS_NUM_SLOTS] = {
    janet_hs_trampoline_0,
    janet_hs_trampoline_1,
    janet_hs_trampoline_2,
    janet_hs_trampoline_3,
    janet_hs_trampoline_4,
    janet_hs_trampoline_5,
    janet_hs_trampoline_6,
    janet_hs_trampoline_7,
    janet_hs_trampoline_8,
    janet_hs_trampoline_9,
    janet_hs_trampoline_10,
    janet_hs_trampoline_11,
    janet_hs_trampoline_12,
    janet_hs_trampoline_13,
    janet_hs_trampoline_14,
    janet_hs_trampoline_15,
};
