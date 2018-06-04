-- Omer Farooq
-- RIT 301-732
-- Use variables doing computation
-- algorithm is to repeat shifting/adding
  

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity multiplier is
port(	a, x:	in std_logic_vector(7 downto 0);
	product: 	out std_logic_vector(15 downto 0)
);
end multiplier;

architecture behv of multiplier is

begin
process(a, x)
	
  variable a_reg: std_logic_vector(8 downto 0);
  variable product_reg: std_logic_vector(23 downto 0);
	
begin	 
	
  a_reg := '0' & a;
  product_reg := "0000000000000000" & x;

  for i in 1 to 15 loop
    if product_reg(0)='1' then
	  product_reg(23 downto 15) := product_reg(23 downto 15) 
	  + a_reg(8 downto 0);
	end if;
	product_reg(23 downto 0) := '0' & product_reg(23 downto 1);
  end loop;
  
  -- assign the result of computation back to output signal
  product <= product_reg(15 downto 0);

end process;

end behv;
