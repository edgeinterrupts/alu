-- Structural description of a 4-bit adder
-- Defining one-bit fulladd component;
-- Author: Omer Farooq
-- EE301-732 RIT WINTER 2004-2005

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fulladd IS
   PORT ( Cin, x, y	:IN  STD_LOGIC;
	  S, Cout	:OUT STD_LOGIC);
END fulladd;

ARCHITECTURE LogicFunc OF fulladd IS
BEGIN
  s     <= x xor y xor Cin;
  Cout  <= (x and Y) or (x and Cin) or (y and Cin);
END LogicFunc;
