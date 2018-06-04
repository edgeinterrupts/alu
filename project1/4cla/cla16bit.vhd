-- Author: Omer Farooq

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity cla16bit is
	 port(
		 InputA : in STD_LOGIC_VECTOR(15 downto 0);
		 InputB : in STD_LOGIC_VECTOR(15 downto 0);
         C_in : in std_logic; 
		 Result :out std_logic_vector(15 downto 0)); 
end cla16bit;

architecture dataflow of cla16bit is

signal C0, C1, C2, C3: std_logic;
signal P, G : std_logic_vector(3 downto 0);

component add_cla
	port(C_In : in std_logic;
	A : in std_logic_vector(3 downto 0);
    B : in std_logic_vector(3 downto 0);
	S : out std_logic_vector(3 downto 0);
	G_Out, P_Out : out std_logic);
end component;

begin
	C0 <= G(0) or (P(0) and C_In);
	C1 <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and C_In);
	C2 <= G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0)) or (P(2) and P(1) and P(0) and C_In);
	C3 <= G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) 
		 					 and G(0)) or (P(3) and P(2) and P(1) and P(0) and C_In);
		
	cla0:  add_cla port map (A => InputA(3 downto 0), B => InputB(3 downto 0), C_In => C_In,
										 S => Result(3 downto 0), P_Out => P(0), G_Out => G(0));
	cla1:  add_cla port map (A => InputA(7 downto 4), B => InputB(7 downto 4), 
										 C_In => C1, S => Result(7 downto 4), P_Out => P(1), G_Out => G(1));
	cla2:  add_cla port map (A => InputA(11 downto 8), B => InputB(11 downto 8), C_In => C2,
										 S =>  Result(11 downto 8), P_Out => P(2), G_Out => G(2));
	cla3:  add_cla port map (A => InputA(15 downto 12), B => InputB(15 downto 12), C_In => C3,
										 S => Result(15 downto 12), P_Out => P(3), G_Out => G(3));
end dataflow;

