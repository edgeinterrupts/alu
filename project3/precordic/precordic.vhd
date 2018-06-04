--omer farooq
-- cordic pre processor block

library ieee ;
use ieee.std_logic_1164.all ;
use IEEE.std_logic_signed.all ;

entity cordicpre is
port(
		x, y, z    : in std_logic_vector(7 downto 0); 
	    opcode     : in std_logic_vector(2 downto 0);
		x_out, y_out, z_out: out std_logic_vector(7 downto 0);
		opcode_out: out std_logic_vector(2 downto 0));
end cordicpre;

architecture behv of cordicpre is

signal x_out_temp : std_logic_vector(7 downto 0);
signal y_out_temp : std_logic_vector(7 downto 0);
signal z_out_temp : std_logic_vector(7 downto 0);


begin

	process(opcode)
	begin

	case opcode is
	    when "000" => -- sin
		x_out_temp <= "00100110";
		y_out_temp<= "00000000";
		z_out_temp<= Z;

	    when "001" => -- cos
		x_out_temp <= "00100110" ;
		y_out_temp<= "00000000";
		z_out_temp<= z;

	    when "010" =>  -- multiplication
		x_out_temp <= "00100110" ;
		y_out_temp<= "00000000";
		z_out_temp<= z;

	    when "011" => -- division
		x_out_temp <= x;
		y_out_temp<= y; 
		z_out_temp<= "00000000";

	    when "100" => -- e
		x_out_temp <= "00100110";
		y_out_temp<= "00000000";
		z_out_temp<= z;
	
	    when "101" =>  -- ln w 
		x_out_temp <= "00000000";
		y_out_temp<= "00000000";
		z_out_temp<= "00000000";

	    when "110" =>   -- sqrt
		x_out_temp <= "00000000";
		y_out_temp<= "00000000";
		z_out_temp<= "00000000";

	    when others =>	 -- just do cos
		x_out_temp <="00000000";  
		y_out_temp<= "00000000";  
		z_out_temp<= "00000000";

        end case;
    end process;

	opcode_out <= opcode;
	x_out <= x_out_temp;
    y_out <= y_out_temp;
	z_out <= z_out_temp;

end behv;

