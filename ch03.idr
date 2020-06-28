-- The Little Typer in Idris
-- Translation of the main ideas of The Little Typer into Idris
--
-- Chapter 3: Eliminate All Natural Numbers!

-- To avoid clashes with Idris' built-in identifiers, everything
-- defined in The Little Typer uses the prefix T

module ch03

import public ch01

||| plusTNat was declared in ch01 to allow TNat to implement the Num interface,
||| but it's definition only appears in Chapter 3
ch01.plusTNat Tzero m = m
ch01.plusTNat (Tadd1 nMinus1) m = Tadd1 (plusTNat nMinus1 m)
