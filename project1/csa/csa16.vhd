library IEEE;
use IEEE.std_logic_1164.all;

entity csa16 is
  port(
    x,y,z: in  std_logic_vector(15 downto 0); 
    Sum, CarryOut : out std_logic_vector(15 downto 0)); 
end csa16;

architecture circuits of csa16 is
signal c: std_logic_vector(15 downto 0) := X"0000";

component adder16 IS
   PORT ( a, b, cin :IN  STD_LOGIC_vector(15 downto 0);
	  AddSum :OUT STD_LOGIC_vector(15 downto 0);
	  cout   :out STD_LOGIC_vector(15 downto 0)); 
END component;

begin 
stage0: adder16 PORT MAP(x,y,z,sum,c); -- get the sumout & carryout
CarryOut <= c(14 downto 0) & '0' ;
end architecture circuits; -- of add32csa
