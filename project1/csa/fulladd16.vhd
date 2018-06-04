-- Structural description of a 16-bit adder
-- Author: Omer Farooq
-- EE301-732 RIT WINTER 2004-2005

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fulladd16 IS
   PORT ( Cin	:IN  STD_LOGIC;
	  a :IN  STD_LOGIC_vector(15 downto 0);
      b :IN  STD_LOGIC_vector(15 downto 0);
	  AddSum: OUT STD_LOGIC_vector(15 downto 0);
	  Cout	:OUT STD_LOGIC);
END fulladd16;


ARCHITECTURE Structure OF fulladd16 IS
   SIGNAL c : STD_LOGIC_vector(14 downto 0);
   COMPONENT fulladd
	PORT (Cin, x, y	:IN  STD_LOGIC;
	      s, Cout	:OUT STD_LOGIC);
   END COMPONENT;
BEGIN
   stage0: fulladd PORT MAP(Cin, a(0),b(0),AddSum(0),c(0));
   stage1: fulladd PORT MAP(c(0),a(1),b(1),AddSum(1),c(1));
   stage2: fulladd PORT MAP(c(1),a(2),b(2),AddSum(2),c(2));
   stage3: fulladd PORT MAP(c(2),a(3),b(3),AddSum(3),c(3));
   stage4: fulladd PORT MAP(c(3),a(4),b(4),AddSum(4),c(4));
   stage5: fulladd PORT MAP(c(4),a(5),b(5),AddSum(5),c(5));
   stage6: fulladd PORT MAP(c(5),a(6),b(6),AddSum(6),c(6));
   stage7: fulladd PORT MAP(c(6),a(7),b(7),AddSum(7),c(7));
   stage8: fulladd PORT MAP(c(7),a(8),b(8),AddSum(8),c(8));
   stage9: fulladd PORT MAP(c(8),a(9),b(9),AddSum(9),c(9));
   stage10: fulladd PORT MAP(c(9),a(10),b(10),AddSum(10),c(10));
   stage11: fulladd PORT MAP(c(10),a(11),b(11),AddSum(11),c(11));
   stage12: fulladd PORT MAP(c(11),a(12),b(12),AddSum(12),c(12));
   stage13: fulladd PORT MAP(c(12),a(13),b(13),AddSum(13),c(13));
   stage14: fulladd PORT MAP(c(13),a(14),b(14),AddSum(14),c(14));
   stage15: fulladd PORT MAP(
		Cin => c(14), Cout=> Cout, x => a(15), y => b(15), s => AddSum(15));
END Structure;	
