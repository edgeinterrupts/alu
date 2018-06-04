--------------------------------------------------------
-- Omer Farooq
-- Multiplication using shifting and Addition. 
--------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- two 4-bit inputs and one 8-bit outputs
entity multiplier is
port(	num1, num2:	in std_logic_vector(7 downto 0);
	product: 	out std_logic_vector(15 downto 0)
);
end multiplier;

architecture behv of multiplier is

begin
process(num1, num2)
	
  variable num1_reg: std_logic_vector(7 downto 0);
  variable product_reg: std_logic_vector(21 downto 0);
	
begin	 
	
  num1_reg := '0' & num1;
  product_reg := "0000" & num2;

  -- use variables doing computation
  -- algorithm is to repeat shifting/adding
  for i in 1 to 15 loop
    if product_reg(0)='1' then
	  product_reg(21 downto 15) := product_reg(21 downto 15) 
	  + num1_reg(7 downto 0);
	end if;
	product_reg(22 downto 0) := '0' & product_reg(21 downto 1);
  end loop;
  
  -- assign the result of computation back to output signal
  product <= product_reg(15 downto 0);

end process;

end behv;


