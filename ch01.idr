-- The Little Typer in Idris
-- Translation of the main ideas of The Little Typer into Idris
--
-- Chapter 1: The More Things Change, the More They Stay the Same

-- To avoid clashes with Idris' built-in identifiers, everything
-- defined in The Little Typer uses the prefix T

module ch01

%default total
%access public export

||| Atoms
||| -----
|||
||| Idris doesn't have a built-in Atom or Symbol type, so for simplicity, we use
||| Strings instead, wrapped in a single-constructor data type.
||| Instead of 'ratatouille, write Q "ratatouille".
|||
||| TODO: We can't enforce that the strings consist of 1+ letters or hyphens.
|||       maybe with some auto-proving magic ?
data TAtom : Type where
  Q : String -> TAtom


||| Pairs
||| -----
||| The idiomatic equivalent in Idris would be Builtins.Pair, for which
||| Idris has tuple sugar.
|||
||| TLTII:  Tcons (TAtom (Q "ratatouille")) : TPair Type TAtom
||| Idris:  (String, "ratatouille") : Pair Type String  (== (Type, String))
|||
||| TODO: Adapt TPair to be syntactic sugar for dependent pairs

data TPair : Type -> Type -> Type where
  Tcons : a -> d -> TPair a d

||| Idris: fst
Tcar : TPair a d -> a
Tcar (Tcons a d) = a

||| Idris: snd
Tcdr : TPair a d -> d
Tcdr (Tcons a d) = d


||| Natural Numbers
||| ---------------
||| Idris has built-in Nats that work just like The Little Typer's

data TNat : Type where
  
  ||| Idris: Z
  Tzero : TNat
  
  ||| Idris: S n
  Tadd1 : TNat -> TNat
  

||| We implement conversion from integers for writing convenience, e.g., (the TNat 5)
||| As in Prelude.Nat, we map negative numbers to Tzero
|||
||| We leave implementations of (+) and (*) to ch03.idr,
||| where we also implement `Num TNat` using fromIntegerTNat
fromIntegerTNat : Integer -> TNat
fromIntegerTNat 0 = Tzero
fromIntegerTNat n =
  if (n > 0) then
    Tadd1 (fromIntegerTNat (assert_smaller n (n - 1)))
  else
    Tzero

||| Frame 1:79
Tone : TNat
Tone = Tadd1 Tzero

||| Frame 1:79
Ttwo : TNat
Ttwo = Tadd1 Tone

||| Frame 1:81
Tfour : TNat
Tfour = Tadd1 $ Tadd1 $ Tadd1 $ Tadd1 Tzero
