# Haskell style guide

Conventions for Haskell code in this repository. These apply to hand-written
code under `lib/`, `exe/`, and any future test suites — not to the generated
bindings under `bindings/Generated/`, which are machine output and out of
scope for style review.

## Syntax preferences

**`$` over nested parens.** Prefer `f $ g a` to `f (g a)`. Chain with `$`
rather than nesting parens when the argument is itself the "last" thing
being built.

```haskell
-- prefer
BSU.unsafePackCString $ castPtr $ unsafeToPtr ptr

-- over
BSU.unsafePackCString (castPtr (unsafeToPtr ptr))
```

**Type applications over `:: T` annotations.** When a type needs to be
pinned to help inference, prefer `f @T x` to `(f x :: T)` or annotating an
intermediate binding.

```haskell
-- prefer
realToFrac @CDouble $ BG.getField @"janet_as_number" $ janet_as v

-- over
(BG.getField @"janet_as_number" (janet_as v) :: CDouble)
```

Caveat: a type application binds type variables in the order they're
quantified, not the order that's convenient. `realToFrac :: (Real a,
Fractional b) => a -> b` quantifies `a` before `b`, so `@CDouble` pins the
*input* type, not the result — check which variable you're actually fixing
before reaching for this. If the variable you need to pin isn't the first
one, either reorder the annotation with an explicit `forall` at the
definition site so `TypeApplications` reads naturally at call sites, or fall
back to an annotation for that call. Don't use a type application if it
requires guessing at variable order under time pressure — a correct `::` is
better than a wrong `@`.

Only use `:: T` when there is no type variable to apply the type to (e.g.
disambiguating a numeric literal in a `case`, or a genuinely unconstrained
`read`/`show`-style call is still fine as `f x :: T` if `f` has no clean
forall to hang a type application on).

**Prefer `\case` (`LambdaCase`) when a function's entire argument is
immediately scrutinized.** This applies to `\x -> case x of ...`, not to
ordinary multi-equation top-level definitions (those are already idiomatic
as-is) and not to a `case` over some expression *derived from* an argument
(`case f x of ...`) — `\case` only replaces the redundant `\x ->`/`case x
of` pair.

```haskell
-- prefer
describe = \case
    Nothing -> "nothing"
    Just x  -> "just " <> show x

-- over
describe x = case x of
    Nothing -> "nothing"
    Just y  -> "just " <> show y
```

## Types over checks

**Make invalid states unrepresentable.** Reach for a sum type or enum
instead of a manual check (a boolean flag, a magic number, a string tag)
whenever the set of valid states is known up front. Pattern-match
exhaustively on the type rather than branching on a derived condition.

In this codebase: `JanetType`'s generated pattern synonyms
(`JANET_NIL`, `JANET_STRING`, ...) are matched directly in `FromJanet`
instances rather than, say, comparing a raw `CUInt` tag by hand.

## Simplicity

**Inline simple, single-use expressions rather than let-floating them.**
A `let`/`where` binding used exactly once, with a short right-hand side,
usually reads better inlined at its use site. Reach for a binding when it's
reused, when naming it clarifies intent, or when the expression is long
enough that inlining would hurt readability — not by default.

**Deriving over manual instances.** Prefer `deriving`/`deriving newtype`/
`deriving via`/`DerivingStrategies` to hand-written instances wherever the
derivation is available. If a type is *almost* derivable — a record needs
reshaping, a newtype needs its representation adjusted, a class needs a
`Generic`-friendly shape — it's fine to ask for that small refactor rather
than hand-write the instance around the awkward shape. A trivially
derivable type is worth more than a type that happens to avoid one field
reorder.

## Custom monads: always provide an escape hatch

A bespoke monad (`Foo a`) should not be the *only* way to get its effects.
Alongside the concrete monad, expose a `MonadFoo m` typeclass capturing its
operations, give the concrete monad a `MonadFoo` instance, and write the
rest of the library's API (marshalling, helpers, everything downstream)
against the `MonadFoo m` constraint instead of the concrete type. The
concrete monad is then just a ready-to-use convenience instance, not a hard
dependency — callers embedding this library's effects into their own monad
transformer stack write one instance instead of being locked out.

This repo's example: `Janet.Monad` exposes both the concrete `JanetM` and
the `MonadJanet m` class (`askJanetEnv`, `tryJanet`); `eval` and everything
in `Janet.Marshal` (`ToJanet`, `FromJanet`, `evalAs`) is written against
`MonadJanet m`, not `JanetM`, specifically so they work in any monad that
provides a `MonadJanet` instance.

```haskell
class MonadIO m => MonadJanet m where
    askJanetEnv :: m JanetEnv
    tryJanet :: m a -> m (Either JanetException a)

instance MonadJanet JanetM where
    ...

eval :: MonadJanet m => Text -> m Janet
```

Functions that only make sense for a whole session's lifecycle (starting
and tearing down the interpreter itself — `runJanetM`, `runJanetMEither`)
are the exception: those own the concrete monad's bracketing and stay
concrete.

## Testing

**Prefer property testing (Hedgehog) over verbose unit testing.** Unit
tests aren't banned — a specific regression, a fixed example from a bug
report, or a case that's awkward to generate is still worth a direct unit
test. But default to a property test when the thing under test has a
law, invariant, or round-trip to state (`fromJanet . toJanet == id`-shaped
properties, parser/printer round trips, "any input of this shape doesn't
crash," etc.) rather than writing out a long list of individual example
assertions that a generator would cover more thoroughly with less code.
Watch for the failure mode of writing five near-identical unit tests that
differ only in their input literal — that's almost always a property test
that hasn't been recognized as one yet.
