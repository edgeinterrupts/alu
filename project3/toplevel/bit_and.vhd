---------------------------------------------------------------------------------------------------
--
-- Title       : bit_and
-- Design      : ese345_Design_Project_ver1
-- Author      : Omer Farooq 	 
-- Author      :  Omer Farooq
-- 				  Gilbert Eng
--
-- Description : 	 bitwise and (PAND)  RSLT = A and B
--
---------------------------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {bit_and} architecture {bit_and}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity bit_and is  	  
  port(
	a: in std_logic_vector(7 downto 0);
	b: in std_logic_vector(7 downto 0);  
	ab: out std_logic_vector(7 downto 0)
	);   
	
end bit_and;

--}} End of automatically maintained section

architecture bit_and of bit_and is
begin 	
	process(a, b)
	begin 
	  ab <= a and b;			
	end process;   

end bit_and;
