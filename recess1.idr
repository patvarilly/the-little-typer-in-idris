-- The Little Typer in Idris
-- Translation of the main ideas of The Little Typer into Idris
--
-- Recess [1]: A Forkful of Pie

module recess1

import public ch02

%default total
%access public export

||| Type annotation expression
Tthe : (X : Type) -> (e : X) -> X   -- "The Law of `the`"
Tthe _ e = e                        -- "The Commandment of `the`"
