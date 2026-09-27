# janet-hs

Embed the [Janet](https://janet-lang.org/) language in Haskell applications,
with a two-way bridge: run Janet code from Haskell, and register Haskell
functions that Janet code can call back into.

Janet's C bindings (`bindings/Generated/`) are generated automatically from
`janet.h` by [hs-bindgen](https://github.com/well-typed/hs-bindgen) — see
`generate-bindings.sh`. They're deterministically reproducible from the
header, so they aren't checked in (see `.gitignore`); a `nix develop` shell
regenerates them automatically the first time they're missing.

## Requirements

[Nix](https://nixos.org/) with flakes enabled. `nix develop` provisions GHC,
`hs-bindgen-cli`, the Janet headers and library, and everything else needed
to build.

## Quick start

```
nix develop
cabal run janet-demo
```

This drops you into a small Janet REPL with a few Haskell-implemented
functions already registered (see `exe/Main.hs`):

```
-> (print (haskell-quick-sort @[5 3 1 4 1 5 9 2 6]))
@[1 1 2 3 4 5 5 6 9]
-> (print (haskell-title-case "hello there world"))
Hello There World
-> (print (haskell-sum 1 2 3 4 5))
15
-> (print (haskell-memo-fib 30))
832040
```

## Library layout

- **`Janet`** — the lowest-level primitives: starting a Janet interpreter
  (`withJanet`) and a couple of raw string helpers. Most code should use the
  modules below instead.
- **`Janet.Monad`** — `JanetM`, a monad for running Janet code, and the
  `MonadJanet` typeclass so those effects can be embedded into your own
  monad stack instead of being locked to `JanetM`. `eval` runs a string of
  Janet source.
- **`Janet.Marshal`** — `ToJanet`/`FromJanet` for converting values between
  Haskell and Janet (`()`, `Bool`, `Double`, `Text`, `Maybe a`, `[a]`), and
  `evalAs` for evaluating Janet source directly into a typed Haskell value.
- **`Janet.Register`** — register a Haskell function as a native Janet
  function (`registerFunction`/`registerFunctions`), of any fixed arity or
  variadic (`Variadic`/`variadic`).

Run `cabal haddock` for the full API documentation.

## Known limitations

- **One Janet session per process.** A second `withJanet`/`runJanetM` call
  in the same process is rejected outright — empirically, re-initializing
  the Janet VM after a `janet_deinit` corrupts subsequently-allocated Janet
  values.
- **No Janet-level panics from Haskell.** A registered Haskell function
  reports an error (wrong arity, a `FromJanet` conversion failure) to
  stderr and returns `nil`, rather than triggering Janet's own
  `janet_panic` (a C `longjmp`), which isn't safe to invoke from a callback
  the GHC RTS invoked.
- **A fixed pool of 16 registerable Haskell functions.** Janet's native
  function type has no userdata slot to carry closure identity, so
  `Janet.Register` bridges through a small fixed pool of C trampolines
  (`cbits/janet_trampolines.c`) — raise `JANET_HS_NUM_SLOTS` there to
  register more.
- `FromJanet [a]` only accepts a Janet array (`@[...]`), not a tuple
  (`[...]`).
- String marshalling assumes no embedded NUL bytes (Janet strings are read
  as NUL-terminated C strings).

## Development

See [`AGENTS.md`](AGENTS.md) and
[`docs/hs_style_guide.md`](docs/hs_style_guide.md) for this project's
Haskell conventions.

To regenerate the bindings by hand (normally automatic on `nix develop`):

```
generate-bindings
```
