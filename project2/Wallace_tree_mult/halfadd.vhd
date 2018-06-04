-- Structural description of a 4-bit adder
-- Defining one-bit fulladd component;
-- Author: Omer Farooq
-- EE301-732 RIT WINTER 2004-2005

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY halfadd IS
   PORT (    x, y	:IN  STD_LOGIC;
	  S, Cout	:OUT STD_LOGIC);
END halfadd;

ARCHITECTURE LogicFunc OF halfadd IS
BEGIN
  s        <=    x xor y ;
  Cout  <= (x and Y) ;
END LogicFunc;
