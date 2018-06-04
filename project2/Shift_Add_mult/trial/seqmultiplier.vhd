-- Omer Farooq
-- RIT 301-732
-- Use variables doing computation
-- algorithm is to repeat shifting/adding 


-- a Multipland 
-- x Multiplier 
-- P Product
  

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity seqmultiplier is
port(	a, x:	in std_logic_vector(7 downto 0);
	    zero  : in std_logic; 
        product: 	out std_logic_vector(15 downto 0)
);
end seqmultiplier; 

architecture Behavioural of seqmultiplier is

   PROCEDURE Full_Adder( a, b : IN  STD_LOGIC_VECTOR (8 downto 0);
					     Sum     : OUT STD_LOGIC_VECTOR (8 DOWNTO 0)) IS

   		PROCEDURE Bit_Full_Adder ( a, b, c       : IN  STD_LOGIC;
                                   Sum, Carryout : OUT STD_LOGIC ) IS
   		BEGIN
      		Sum      :=  a XOR b XOR c ;
      		Carryout :=  (a AND b) OR (a AND c) OR (b AND c) ;  	
   		END; -- end of Bit_Full_Adder
	
   VARIABLE  carrys : STD_LOGIC_VECTOR (7 DOWNTO 0);
   BEGIN
	  
      FOR i IN 1 TO 8 LOOP
	    if i = 0 then
			Bit_Full_Adder(a(i), b(i), zero, sum(i), carrys(i));
		else 
  	 		Bit_Full_Adder (a(i), b(i), carrys(i), sum(i), carrys(i));
	  	end IF;
	 END LOOP;
   END; -- end of procedure Full_Adder


begin

process(a, x)
  variable multiplicand_register: std_logic_vector(8 downto 0);
  variable product_register: std_logic_vector(23 downto 0);
  variable carry_throw_out: std_logic; 
begin	
  multiplicand_register := '0' & a;
  product_register := "0000000000000000" & x;
  for i in 1 to 15 loop
      if product_register(0)='1' then
		Full_Adder( product_register(23 downto 15),
                    multiplicand_register(8 downto 0), product_register(23 downto 15));   
	end if;
	product_register(23 downto 0) := '0' & product_register(23 downto 1);
  end loop;  
  -- assign the result of computation back to output signal
  product <= product_register(15 downto 0);
end process;
END Behavioural;
