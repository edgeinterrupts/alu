-- Structural description of a 16-bit adder
-- Author: Omer Farooq
-- EE301-732 RIT WINTER 2004-2005

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY adder16 IS
   PORT ( a, b, cin :IN  STD_LOGIC_vector(15 downto 0);
	  AddSum: OUT STD_LOGIC_vector(15 downto 0);
	  cout :  out STD_LOGIC_vector(15 downto 0)); 
END adder16;


ARCHITECTURE Structure OF adder16 IS   
   COMPONENT fulladd
	PORT (Cin, x, y	:IN  STD_LOGIC;
	      s, Cout	:OUT STD_LOGIC);
   END COMPONENT;

BEGIN
   stage0: fulladd PORT MAP(Cin(0),a(0),b(0),AddSum(0),cout(0));
   stage1: fulladd PORT MAP(Cin(1),a(1),b(1),AddSum(1),cout(1));
   stage2: fulladd PORT MAP(Cin(2),a(2),b(2),AddSum(2),cout(2));
   stage3: fulladd PORT MAP(Cin(3),a(3),b(3),AddSum(3),cout(3));
   stage4: fulladd PORT MAP(Cin(4),a(4),b(4),AddSum(4),cout(4));
   stage5: fulladd PORT MAP(Cin(5),a(5),b(5),AddSum(5),cout(5));
   stage6: fulladd PORT MAP(Cin(6),a(6),b(6),AddSum(6),cout(6));
   stage7: fulladd PORT MAP(Cin(7),a(7),b(7),AddSum(7),cout(7));
   stage8: fulladd PORT MAP(Cin(8),a(8),b(8),AddSum(8),cout(8));
   stage9: fulladd PORT MAP(Cin(9),a(9),b(9),AddSum(9),cout(9));
   stage10: fulladd PORT MAP(Cin(10),a(10),b(10),AddSum(10),cout(10));
   stage11: fulladd PORT MAP(Cin(11),a(11),b(11),AddSum(11),cout(11));
   stage12: fulladd PORT MAP(Cin(12),a(12),b(12),AddSum(12),cout(12));
   stage13: fulladd PORT MAP(Cin(13),a(13),b(13),AddSum(13),cout(13));
   stage14: fulladd PORT MAP(Cin(14),a(14),b(14),AddSum(14),cout(14));
   stage15: fulladd PORT MAP(
		Cin => cin(15), Cout=> Cout(15), x => a(15), y => b(15), s => AddSum(15));
END Structure;	
