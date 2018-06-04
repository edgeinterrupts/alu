--omer farooq
-- final 
-- Figure out which is the output. 
-- if the function requires processsing do that. 

library ieee ;
use ieee.std_logic_1164.all ;
use IEEE.std_logic_signed.all ;

entity postcordic is
port(
		x, y, z    : in std_logic_vector(7 downto 0); 
	   opcode     : in std_logic_vector(2 downto 0);
		z_out: out std_logic_vector(7 downto 0)
		);
end postcordic;

architecture behv of postcordic is

signal x_out_temp : std_logic_vector(7 downto 0);
signal y_out_temp : std_logic_vector(7 downto 0);
signal z_out_temp : std_logic_vector(7 downto 0);


begin
	process(opcode)
	begin
      case opcode is
	      when "000"  => z_out_temp <= Z;-- sin
         when "001"  => z_out_temp <= Z;-- cos 
         when "010"  => z_out_temp <= Z;-- multiplication
         when "011"  => z_out_temp <= Z;-- division
         when "100"  => z_out_temp <= Z;-- e(z)
         when "001"  => z_out_temp <= Z;-- ln(w)
         when "110"  => z_out_temp <= Z;-- sqrt
         when others => z_out_temp <= "00000000";-- none
      end case;
    end process;
    
    z_out <= z_out_temp;
end behv;

