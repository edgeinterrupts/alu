-- Struct-- structural description of a 4-bit adder
-- Defining one-bit fulladd component;
-- Author: Omer Farooq
-- EE301-732 RIT WINTER 2004-2005

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY arraymultiply IS
   PORT (a, b		:IN  std_logic_vector(7 downto 0);
   	 zero           :in  std_logic;
	 product		:OUT std_logic_vector(15 downto 0));
END arraymultiply;

ARCHITECTURE Structure OF arraymultiply IS
    SIGNAL s, c   : std_logic_vector(55 downto 0); 
    signal and_sig  : std_logic_vector(63 downto 0);
   	
   COMPONENT fulladd
	PORT (Cin, x, y	:IN  STD_LOGIC;
	      s, Cout	:OUT STD_LOGIC);
   END COMPONENT;  
   
BEGIN
    -- a(0)
    and_sig(0) <= a(0) and b(0); 
    and_sig(1) <= a(0) and b(1);
    and_sig(2) <= a(0) and b(2);
    and_sig(3) <= a(0) and b(3);
    and_sig(4) <= a(0) and b(4);
    and_sig(5) <= a(0) and b(5);
    and_sig(6) <= a(0) and b(6);
    and_sig(7) <= a(0) and b(7);
    
    -- a(1) 
    and_sig(8)  <=  a(1) and b(0); 
    and_sig(9)  <=  a(1) and b(1);
    and_sig(10) <= a(1) and b(2);
    and_sig(11) <= a(1) and b(3);
    and_sig(12) <= a(1) and b(4);
    and_sig(13) <= a(1) and b(5);
    and_sig(14) <= a(1) and b(6);
    and_sig(15) <= a(1) and b(7);
    
    -- a(2)
    and_sig(16) <= a(2) and b(0); 
    and_sig(17) <= a(2) and b(1);
    and_sig(18) <= a(2) and b(2);
    and_sig(19) <= a(2) and b(3);
    and_sig(20) <= a(2) and b(4);
    and_sig(21) <= a(2) and b(5);
    and_sig(22) <= a(2) and b(6);
    and_sig(23) <= a(2) and b(7);    
    
    -- a(3)
    and_sig(24) <= a(3) and b(0); 
    and_sig(25) <= a(3) and b(1);
    and_sig(26) <= a(3) and b(2);
    and_sig(27) <= a(3) and b(3);
    and_sig(28) <= a(3) and b(4);
    and_sig(29) <= a(3) and b(5);
    and_sig(30) <= a(3) and b(6);
    and_sig(31) <= a(3) and b(7);
    
    -- a(3)
    and_sig(32) <= a(4) and b(0); 
    and_sig(33) <= a(4) and b(1);
    and_sig(34) <= a(4) and b(2);
    and_sig(35) <= a(4) and b(3);
    and_sig(36) <= a(4) and b(4);
    and_sig(37) <= a(4) and b(5);
    and_sig(38) <= a(4) and b(6);
    and_sig(39) <= a(4) and b(7);
    
    -- a(5)
    and_sig(40) <= a(5) and b(0); 
    and_sig(41) <= a(5) and b(1);
    and_sig(42) <= a(5) and b(2);
    and_sig(43) <= a(5) and b(3);
    and_sig(44) <= a(5) and b(4);
    and_sig(45) <= a(5) and b(5);
    and_sig(46) <= a(5) and b(6);
    and_sig(47) <= a(5) and b(7);


    -- a(6)
    and_sig(48) <= a(6) and b(0); 
    and_sig(49) <= a(6) and b(1);
    and_sig(50) <= a(6) and b(2);
    and_sig(51) <= a(6) and b(3);
    and_sig(52) <= a(6) and b(4);
    and_sig(53) <= a(6) and b(5);
    and_sig(54) <= a(6) and b(6);
    and_sig(55) <= a(6) and b(7);
    
    -- a(7)
    and_sig(56) <= a(7) and b(0); 
    and_sig(57) <= a(7) and b(1);
    and_sig(58) <= a(7) and b(2);
    and_sig(59) <= a(7) and b(3);
    and_sig(60) <= a(7) and b(4);
    and_sig(61) <= a(7) and b(5);
    and_sig(62) <= a(7) and b(6);
    and_sig(63) <= a(7) and b(7);

    --stage 0 - 6 
    stage0: fulladd PORT MAP(zero, and_sig(56), and_sig(49), s(0), c(0));
    stage1: fulladd PORT MAP(zero, and_sig(48), and_sig(41), s(1), c(1));
    stage2: fulladd PORT MAP(zero, and_sig(40), and_sig(33), s(2), c(2));
    stage3: fulladd PORT MAP(zero, and_sig(32), and_sig(25), s(3), c(3));
    stage4: fulladd PORT MAP(zero, and_sig(24), and_sig(17), s(4), c(4));
    stage5: fulladd PORT MAP(zero, and_sig(16), and_sig(9),  s(5), c(5));
    stage6: fulladd PORT MAP(zero, and_sig(8),  and_sig(1),  s(6), c(6));

    --stage 7 - 13
    stage7:  fulladd PORT MAP(c(0), and_sig(57), and_sig(50), s(7), c(7));
    stage8:  fulladd PORT MAP(c(1), s(0), and_sig(42), s(8), c(8));
    stage9:  fulladd PORT MAP(c(2), s(1), and_sig(34), s(9), c(9));
    stage10: fulladd PORT MAP(c(3), s(2), and_sig(26), s(10), c(10));
    stage11: fulladd PORT MAP(c(4), s(3), and_sig(18), s(11), c(11));
    stage12: fulladd PORT MAP(c(5), s(4), and_sig(10), s(12), c(12));
    stage13: fulladd PORT MAP(c(6), s(5), and_sig(2), s(13), c(13));

    --stage 14 - 20 
    stage14:  fulladd PORT MAP(c(7), and_sig(58), and_sig(51), s(14), c(14));
    stage15:  fulladd PORT MAP(c(8), s(7), and_sig(43), s(15), c(15));
    stage16:  fulladd PORT MAP(c(9), s(8), and_sig(35), s(16), c(16));
    stage17: fulladd PORT MAP(c(10), s(9), and_sig(27), s(17), c(17));
    stage18: fulladd PORT MAP(c(11), s(10), and_sig(19), s(18), c(18));
    stage19: fulladd PORT MAP(c(12), s(11), and_sig(11), s(19), c(19));
    stage20: fulladd PORT MAP(c(13), s(12), and_sig(3), s(20), c(20));


    --stage 21 - 27
    stage21:  fulladd PORT MAP(c(14), and_sig(59), and_sig(51),  s(21), c(21));
    stage22:  fulladd PORT MAP(c(15), s(14), and_sig(44), s(22), c(22));
    stage23:  fulladd PORT MAP(c(16), s(15), and_sig(36), s(23), c(23));
    stage24: fulladd PORT MAP(c(17),  s(16), and_sig(28), s(24),  c(24));
    stage25: fulladd PORT MAP(c(18),  s(17), and_sig(20), s(25),  c(25));
    stage26: fulladd PORT MAP(c(19),  s(18), and_sig(12), s(26),  c(26));
    stage27: fulladd PORT MAP(c(20),  s(19), and_sig(4), s(27),   c(27));


    --stage 28 - 34 
    stage28:  fulladd PORT MAP(c(21), and_sig(60), and_sig(53), s(28), c(28));
    stage29:  fulladd PORT MAP(c(22), s(21), and_sig(45), s(29), c(29));
    stage30:  fulladd PORT MAP(c(23), s(22), and_sig(37), s(30), c(30));
    stage31:  fulladd PORT MAP(c(24), s(23), and_sig(29), s(31), c(31));
    stage32:  fulladd PORT MAP(c(25), s(24), and_sig(21), s(32), c(32));
    stage33:  fulladd PORT MAP(c(26), s(25), and_sig(13), s(33), c(33));
    stage34:  fulladd PORT MAP(c(27), s(26), and_sig(5), s(34), c(34));

    --stage 35 - 41 
    stage35:  fulladd PORT MAP(c(28), and_sig(61), and_sig(54), s(35), c(35));
    stage36:  fulladd PORT MAP(c(29), s(28), and_sig(46), s(36), c(36));
    stage37:  fulladd PORT MAP(c(30), s(29), and_sig(38), s(37), c(37));
    stage38:  fulladd PORT MAP(c(31), s(30), and_sig(30), s(38), c(38));
    stage39:  fulladd PORT MAP(c(32), s(31), and_sig(22), s(39), c(39));
    stage40:  fulladd PORT MAP(c(33), s(32), and_sig(14), s(40), c(40));
    stage41:  fulladd PORT MAP(c(34), s(33), and_sig(6), s(41), c(41));
    
        --stage 42 - 48 
    stage42:  fulladd PORT MAP(c(35), and_sig(62), and_sig(55), s(42), c(42));
    stage43:  fulladd PORT MAP(c(36), s(35), and_sig(47), s(43), c(43));
    stage44:  fulladd PORT MAP(c(37), s(36), and_sig(39), s(44), c(44));
    stage45:  fulladd PORT MAP(c(38), s(37), and_sig(31), s(45), c(45));
    stage46:  fulladd PORT MAP(c(39), s(38), and_sig(23), s(46), c(46));
    stage47:  fulladd PORT MAP(c(40), s(39), and_sig(15), s(47), c(47));
    stage48:  fulladd PORT MAP(c(41), s(40), and_sig(7), s(48), c(48));
 
     --stage 49 - 55 
    stage49:  fulladd PORT MAP(c(42), and_sig(63), c(50), s(49), c(49));
    stage50:  fulladd PORT MAP(c(43), s(42), c(51), s(50), c(50));
    stage51:  fulladd PORT MAP(c(44), s(42), c(52), s(51), c(51));
    stage52: fulladd PORT MAP(c(45), s(42), c(53), s(52), c(52));
    stage53: fulladd PORT MAP(c(46), s(42), c(54), s(53), c(53));
    stage54: fulladd PORT MAP(c(47), s(42), c(55), s(54), c(54));
    stage55: fulladd PORT MAP(c(48), s(42), zero, s(55), c(55));
 
    -- outputs
    product(0)  <=  and_sig(0);
    product(1)  <=  s(6);
    product(2)  <=  s(13);
    product(3)  <=  s(20);
    product(4)  <=  s(27);
    product(5)  <=  s(34);
    product(6)  <=  s(41);
    product(7)  <=  s(48);
    product(8)  <=  s(55);
    product(9)  <=  s(54);
    product(10) <=  s(53);
    product(11) <=  s(52);
    product(12) <=  s(51);
    product(13) <=  s(50);
    product(14) <=  s(49);
    product(15) <=  c(49);
  
END Structure;	

