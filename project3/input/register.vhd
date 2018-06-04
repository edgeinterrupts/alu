library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity reg8bit is
port(I:	      in std_logic_vector(7 downto 0);
	load:	  in std_logic;
	Q:	out std_logic_vector(7 downto 0)
);
end reg8bit;

architecture behv of register is
    signal data_tmp: std_logic_vector(7 downto 0);
begin

	process(I, clock, load, clear)
    begin

	if load = '1' then
		data_tmp<= I;
	    end if;
	end if;

    end process;

    -- concurrent statement
    Q <= data_tmp;

end behv;


