-- The Little Typer in Idris
-- Translation of the main ideas of The Little Typer into Idris
--
-- Chapter 2: Doin' What Comes Naturally

module ch02

import public ch01

%default total
%access public export

||| Frame 2:35
Tvegetables : TPair TAtom TAtom
Tvegetables = Tcons (Q "celery") (Q "carrot")

||| which-Nat eliminator for Nats (Idris would use pattern matching)
TwhichNat : {X : Type} ->                   -- "The Law of which-Nat"
            (target : TNat) ->
            (base : X) ->
            (step : (TNat -> X)) ->
            X
TwhichNat Tzero base step =                 -- "The First Commandment of which-Nat"
  base
TwhichNat (Tadd1 targetMinus1) base step =  -- "The Second Commandment of which-Nat"
  step targetMinus1

||| Frame 2:52.  Declaration of the Gaussian sum 1 + 2 + ... + n
Tgauss : TNat -> TNat


||| The type of types
TU : Type
TU = Type

||| Frame 2:80
TPear : TU
TPear = TPair TNat TNat

||| Frame 2:93 (1 of 2)
TPearMaker : TU
TPearMaker = TNat -> TNat -> TPear

||| Frame 2:93 (2 of 2)
TelimPear : TPear -> TPearMaker -> TPear
TelimPear pear maker = maker (Tcar pear) (Tcdr pear)

||| Frame 2:100 (we have to leave Tplus as a hole for now, filled in in Chapter 3)
TpearwisePlus : TPear -> TPear -> TPear
TpearwisePlus anjou bosc =
  TelimPear anjou $ \a1, d1 =>
  TelimPear bosc $ \a2, d2 =>
  Tcons (?Tplus a1 a2) (?Tplus d1 d2)

-- Idiomatic use of pattern matching instead of Tcar and Tcdr
TelimPear' : TPear -> TPearMaker -> TPear
TelimPear' (Tcons a d) maker = maker a d

-- Idiomatic use of pattern matching instead of eliminators
TpearwisePlus' : TPear -> TPear -> TPear
TpearwisePlus' (Tcons a1 d1) (Tcons a2 d2) = Tcons (?Tplus a1 a2) (?Tplus d1 d2)
