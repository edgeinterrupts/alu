-- Author: Omer Farooq
-- EE301-732 RIT WINTER 2004-2005

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY wallacetree IS
   PORT (a, b	   : in std_logic_vector(7 downto 0);
   	 zero           :in  std_logic;
	 product	   :out  std_logic_vector(15 downto 0));
END wallacetree;

ARCHITECTURE Structure OF wallacetree IS
   signal and_sig   : std_logic_vector(63 downto 0);
   signal s, c  : std_logic_vector(57 downto 0);	

   COMPONENT halfadd IS
   PORT (    x, y	:IN  STD_LOGIC;
	  S, Cout	:OUT STD_LOGIC);
   END COMPONENT; 	
   	
   COMPONENT fulladd IS
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


    -- Note on notation of the stage: 
    -- ex: lev1col1 ==>  lev1 == level 1 and  col1 == Column # 1. 

    --stage Level 1 
    lev1col1:   halfadd PORT MAP(and_sig(1), and_sig(8), s(0), c(0));   -- P(1)
    lev1col2:   fulladd PORT MAP(and_sig(2), and_sig(9), and_sig(16), s(1), c(1)); 
    lev1col3:   fulladd PORT MAP(and_sig(3), and_sig(10), and_sig(17), s(2), c(2)); 
    lev1col4:   fulladd PORT MAP(and_sig(4), and_sig(11), and_sig(18), s(3), c(3)); 
    lev1col5:   fulladd PORT MAP(and_sig(5), and_sig(12), and_sig(19), s(4), c(4)); 
    lev1col5a:  fulladd PORT MAP(and_sig(26), and_sig(33), and_sig(40), s(5), c(5)); 
    lev1col6:   fulladd PORT MAP(and_sig(6), and_sig(13), and_sig(20), s(6), c(6)); 
    lev1col6a:   fulladd PORT MAP(and_sig(27), and_sig(34), and_sig(41), s(7), c(7)); 
    lev1col7:   fulladd PORT MAP(and_sig(7), and_sig(14), and_sig(21), s(8), c(8));
    lev1col7a:  fulladd PORT MAP(and_sig(28), and_sig(35), and_sig(42), s(9), c(9)); 
    lev1col8:   fulladd PORT MAP(and_sig(15), and_sig(22), and_sig(29), s(10), c(10)); 
    lev1col8a:  fulladd PORT MAP(and_sig(36), and_sig(43), and_sig(50), s(11), c(11));   
    lev1col9:   fulladd PORT MAP(and_sig(23), and_sig(30), and_sig(37), s(12), c(12)); 
    lev1col9a:  fulladd PORT MAP(and_sig(44), and_sig(51), and_sig(58), s(13), c(13));  
    lev1col10: fulladd PORT MAP(and_sig(31), and_sig(38), and_sig(45), s(14), c(14)); 
    lev1col11: fulladd PORT MAP(and_sig(39), and_sig(46), and_sig(53), s(15), c(15)); 
    lev1col12: fulladd PORT MAP(and_sig(47), and_sig(54), and_sig(61), s(16), c(16)); 

    --stage Level 2 
    lev2col2: halfadd PORT MAP(c(0), s(1), s(17), c(17));  -- output P(2) 
    lev2col3: fulladd PORT MAP(c(1), and_sig(24), s(2), s(18), c(18)); 
    lev2col4: fulladd PORT MAP(c(2), and_sig(25), s(3), s(19), c(19)); 
    lev2col5: fulladd PORT MAP(c(3), s(4), s(5), s(20), c(20)); 
    lev2col6: fulladd PORT MAP(s(6), s(7), and_sig(48), s(21), c(21)); 
    lev2col7: fulladd PORT MAP(c(6), s(9), s(8),  s(22), c(22));
    lev2col7a: fulladd PORT MAP(c(7), and_sig(49),  and_sig(56),  s(23), c(23)); 
    lev2col8:  fulladd PORT MAP(c(8), s(10), s(11), s(24), c(24)); 
    lev2col9:  fulladd PORT MAP(c(10), s(12), s(13),  s(25), c(25)); 
    lev2col10: fulladd PORT MAP(c(13), c(12), s(14),  s(26), c(26)); 
    lev2col11: fulladd PORT MAP(c(14), s(15), and_sig(60), s(27), c(27)); 
    lev2col13: fulladd PORT MAP(c(16), and_sig(55), and_sig(62),  s(28), c(28)); 

    --stage Level 3  
    lev3col3: halfadd PORT MAP(c(17), s(18), s(29), c(29));  -- P(3)
    lev3col4: fulladd PORT MAP(c(18), and_sig(32), s(19), s(30), c(30));
    lev3col6: fulladd PORT MAP(c(20), s(21), c(4), s(31), c(31));
    lev3col7: fulladd PORT MAP(c(21), s(22), s(23), s(32), c(32));
    lev3col8: fulladd PORT MAP(c(22), c(23), s(24), s(33), c(33));
    lev3col9: fulladd PORT MAP(c(24), s(25), c(11), s(34), c(34));
    lev3col10: fulladd PORT MAP(c(25), and_sig(52), and_sig(59), s(35), c(35));
    lev3col12: fulladd PORT MAP(c(27), s(16), s(15), s(36), c(36));


    --stage Level 4
    lev4col3:    halfadd PORT MAP(c(29), s(30), s(37), c(37)); -- P(4)
    lev4col4:    fulladd PORT MAP(c(30), s(20), c(19), s(38), c(38));
    lev4col6:    halfadd PORT MAP(c(5),  s(31), s(39), c(39));
    lev4col7:    halfadd PORT MAP(c(31), s(32), s(40), c(40));
    lev4col8:    fulladd PORT MAP(c(32), s(33), c(9),  s(41), c(41)); 
    lev4col9:    fulladd PORT MAP(c(34), s(26), s(35), s(42), c(42));
    lev4col10:   fulladd PORT MAP(c(35), c(26), s(27), s(43), c(43));   

    --stage Level 5
    lev5col5:    halfadd PORT MAP(c(37), s(38), s(44), c(44));   --P(5)
    lev5col6:    halfadd PORT MAP(c(38), s(39), s(45), c(45)); 
    lev5col7:    halfadd PORT MAP(c(39), s(40), s(46), c(46)); 
    lev5col8:    fulladd PORT MAP(s(41), s(39), and_sig(57), s(47), c(47)); 
    lev5col9:    fulladd PORT MAP(c(41), c(33), s(34), s(48), c(48)); 


    --Bit Adder Level 
    bitAdd0:  halfadd PORT MAP(c(44), s(45), s(49), c(49)); 
    bitAdd1:  fulladd PORT MAP(c(45), s(46), c(49), s(50), c(50)); 
    bitAdd2:  fulladd PORT MAP(c(46), s(47), c(50), s(51), c(51)); 
    bitAdd3:  fulladd PORT MAP(c(47), s(48), c(51), s(52), c(52)); 
    bitAdd4:  fulladd PORT MAP(c(48), s(42), c(52), s(53), c(53)); 
    bitAdd5:  fulladd PORT MAP(c(42), s(43), c(53), s(55), c(54));
    bitAdd6:  fulladd PORT MAP(c(43), s(36), c(54), s(56), c(55));
    bitAdd7:  fulladd PORT MAP(c(36), s(28), c(55), s(57), c(56));
    bitAdd8:  fulladd PORT MAP(c(28), and_sig(63), c(56), s(57), c(57));
 
    -- outputs
    product(0)  <=  and_sig(0);
    product(1)  <=  s(0);
    product(2)  <=  s(17);
    product(3)  <=  s(29);
    product(4)  <=  s(37);
    product(5)  <=  s(44);
    product(6)  <=  s(49);
    product(7)  <=  s(50);
    product(8)  <=  s(51);
    product(9)  <=  s(52);
    product(10) <=  s(53);
    product(11) <=  s(54);
    product(12) <=  s(55);
    product(13) <=  s(56);
    product(14) <=  s(57);
    product(15) <=  c(57);
  
END Structure;