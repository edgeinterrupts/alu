
-- Author      :  Omer Farooq

library IEEE;
use IEEE.STD_LOGIC_1164.all;
	
entity cla16 is
 port(    A : in STD_LOGIC_VECTOR(15 downto 0);
          B : in STD_LOGIC_VECTOR(15 downto 0);  
          C_In : in std_logic;
          S : out STD_LOGIC_VECTOR(15 downto 0);
          cout  : out STD_LOGIC);
end cla16;

architecture dataflow of cla16 is

signal C, P, G :STD_LOGIC_VECTOR(15 downto 0);

component partial_adder 	
	port(a, b, c: in std_logic;
	S, P, G: out std_logic);
end component;

begin 

pfa0: partial_adder port map (a => A(0), b => B(0), c => C_In, P => P(0), G => G(0), S => S(0));
pfa1: partial_adder port map (a => A(1), b => B(1), c => c(1), P => P(1), G => G(1), S => S(1));
pfa2: partial_adder port map (a => A(2), b => B(2), c => c(2), P => P(2), G => G(2), S => S(2));
pfa3: partial_adder port map (a => A(3), b => B(3), c => c(3), P => P(3), G => G(3), S => S(3));

pfa4: partial_adder port map (a => A(4), b => B(4), c => C(4), P => P(4), G => G(4), S => S(4));
pfa5: partial_adder port map (a => A(5), b => B(5), c => C(5), P => P(5), G => G(5), S => S(5));
pfa6: partial_adder port map (a => A(6), b => B(6), c => C(6), P => P(6), G => G(6), S => S(6));
pfa7: partial_adder port map (a => A(7), b => B(7), c => C(7), P => P(7), G => G(7), S => S(7));

pfa8: partial_adder port map (a => A(8), b => B(8), c =>C(8), P => P(8), G => G(8), S => S(8));
pfa9: partial_adder port map (a => A(9), b => B(9), c => C(9), P => P(9), G => G(9), S => S(9));
pfa10: partial_adder port map (a => A(10), b => B(10), c => C(10), P => P(10), G => G(10), S => S(10));
pfa11: partial_adder port map (a => A(11), b => B(11), c =>C(11), P => P(11), G => G(11), S => S(11));

pfa12: partial_adder port map (a => A(12), b => B(12), c =>C(12), P => P(12), G => G(12), S => S(12));
pfa13: partial_adder port map (a => A(13), b => B(13), c => C(13), P => P(13), G => G(13), S => S(13));
pfa14: partial_adder port map (a => A(14), b => B(14), c => C(14), P => P(14), G => G(14), S => S(14));
pfa15: partial_adder port map (a => A(15), b => B(15), c => C(15), P => P(15), G => G(15), S => S(15));

C(0) <= C_In; 
C(1) <= G(0) or (P(0) and C(0));
C(2) <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and C_In);
C(3) <= G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0)) or (P(2) and P(1) and P(0) and C_In);
C(4)<= G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) 
                                          and G(0)) or (P(3) and P(2) and P(1) and P(0) and C_In);

C(5) <= G(4) or (P(4) and (G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) 
                                          and G(0)) or (P(3) and P(2) and P(1) and P(0) and C_In)));
C(6) <= G(5) or (P(5) and (G(4) or (P(4) and (G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) 
                                          and G(0)) or (P(3) and P(2) and P(1) and P(0) and C_In)))));
C(7) <= G(6) or (P(6) and (G(5) or (P(5) and (G(4) or (P(4) and (G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) 
                                          and G(0)) or (P(3) and P(2) and P(1) and P(0) and C_In)))))));
C(8)<=  G(7) or (P(7) and (G(6) or (P(6) and (G(5) or (P(5) and (G(4) or (P(4) and (G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) 
                                          and G(0)) or (P(3) and P(2) and P(1) and P(0) and C_In))))))))); 


C(9) <= G(8)  or (P(8) and (G(7) or (P(7) and (G(6) or (P(6) and (G(5) or (P(5) and (G(4) or (P(4) and (G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) 
                                          and G(0)) or (P(3) and P(2) and P(1) and P(0) and C_In)))))))))));
C(10) <= G(9)  or (P(9) and (G(0)  or (P(0) and (G(7) or (P(7) and (G(6) or (P(6) and (G(5) or (P(5) and (G(4) or (P(4) and (G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) 
                                          and G(0)) or (P(3) and P(2) and P(1) and P(0) and C_In)))))))))))));
C(11) <= G(10) or (P(10) and (G(1)  or (P(1) and (G(0)  or (P(0) and (G(7) or (P(7) and (G(6) or (P(6) and (G(5) or (P(5) and (G(4) or (P(4) and (G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) 
                                          and G(0)) or (P(3) and P(2) and P(1) and P(0) and C_In)))))))))))))));
C(12)<= G(11)  or (P(11) and (G(2) or (P(2) and (G(1)  or (P(1) and (G(0)  or (P(0) and (G(7) or (P(7) and (G(6) or (P(6) and (G(5) or (P(5) and (G(4) or (P(4) and (G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) 
                                          and G(0)) or (P(3) and P(2) and P(1) and P(0) and C_In)))))))))))))))));


C(13) <= G(12) or (P(12) and (G(11)  or (P(11) and (G(2) or (P(2) and (G(1)  or (P(1) and (G(0)  or (P(0) and (G(7) or (P(7) and (G(6) or (P(6) and (G(5) or (P(5) and (G(4) or (P(4) and (G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) 
                                          and G(0)) or (P(3) and P(2) and P(1) and P(0) and C_In)))))))))))))))))));
C(14) <= G(13) or (P(13) and (G(12) or (P(12) and (G(11)  or (P(11) and (G(2) or (P(2) and (G(1)  or (P(1) and (G(0)  or (P(0) and (G(7) or (P(7) and (G(6) or (P(6) and (G(5) or (P(5) and (G(4) or (P(4) and (G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) 
                                          and G(0)) or (P(3) and P(2) and P(1) and P(0) and C_In)))))))))))))))))))));
C(15) <= G(14) or (P(14) and (G(13) or (P(13) and (G(12) or (P(12) and (G(11)  or (P(11) and (G(2) or (P(2) and (G(1)  or (P(1) and (G(0)  or (P(0) and (G(7) or (P(7) and (G(6) or (P(6) and (G(5) or (P(5) and (G(4) or (P(4) and (G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) 
                                          and G(0)) or (P(3) and P(2) and P(1) and P(0) and C_In)))))))))))))))))))))));
cout  <= G(15) or (P(15) and (G(14) or (P(14) and (G(13) or (P(13) and (G(12) or (P(12) and (G(11)  or (P(11) and (G(2) or (P(2) and (G(1)  or (P(1) and (G(0)  or (P(0) and (G(7) or (P(7) and (G(6) or (P(6) and (G(5) or (P(5) and (G(4) or (P(4) and (G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1)and G(0)) or (P(3) and P(2) and P(1) and P(0) and C_In)))))))))))))))))))))))));

end dataflow;
