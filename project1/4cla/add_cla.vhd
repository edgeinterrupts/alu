-- Title       : add_cla
-- Design      : ese345_ver1
-- Author      :  Omer Farooq

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity add_cla is
	 port(C_In : in STD_LOGIC;
                  A : in STD_LOGIC_VECTOR(3 downto 0);
	B : in STD_LOGIC_VECTOR(3 downto 0);
	S : out STD_LOGIC_VECTOR(3 downto 0); 
	G_Out : out std_logic;
	P_Out : out std_logic);	     
end add_cla;

architecture dataflow of add_cla is

signal c1, c2, c3: std_logic;
signal P, G: STD_LOGIC_VECTOR(3 downto 0);

component partial_adder 	
	port(a, b, c: in std_logic;
	S, P, G: out std_logic);
end component;

begin
	c1 <= G(0) or (P(0) and C_In);
	c2 <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and C_In);
	c3 <= G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0)) or (P(2) and P(1) and P(0) and C_In);
		
	P_Out <= P(3) and P(2) and P(1) and P(0);
	G_Out <= G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) and G(0));

    pfa0: partial_adder port map (a => A(0), b => B(0), c => C_In, P => P(0), G => G(0), S => S(0));
	pfa1: partial_adder port map (a => A(1), b => B(1), c => c1, P => P(1), G => G(1), S => S(1));
	pfa2: partial_adder port map (a => A(2), b => B(2), c => c2, P => P(2), G => G(2), S => S(2));
	pfa3: partial_adder port map (a => A(3), b => B(3), c => c3, P => P(3), G => G(3), S => S(3));
end dataflow;
