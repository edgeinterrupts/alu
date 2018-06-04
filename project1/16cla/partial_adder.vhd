library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity partial_adder is
	 port(
		 A : in STD_LOGIC;
		 B : in STD_LOGIC;
		 C : in STD_LOGIC;
		 S : out STD_LOGIC;
		 G : out STD_LOGIC;
		 P : out STD_LOGIC
	     );
end partial_adder;

architecture dataflow of partial_adder is
begin 
	S <= (A xor B) xor C;
	P <= A xor B;
	G <= A and B;
end dataflow;