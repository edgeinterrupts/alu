library IEEE;
use IEEE.std_logic_1164.all;

entity 8to2csa is
  port(
    x,y,z      : in  std_logic; 
    Sum, CarryOut : out std_logic_vector(15 downto 0)); 
end 8to2csa;

architecture circuits of 8to2csa is
 signal a,b,c : std_logic_vector(15 downto 0);

component csa16 is
  port(x,y,z: in  std_logic_vector(15 downto 0); 
    Sum, CarryOut : out std_logic_vector(15 downto 0)); 
END component;

begin
stage0: csa16 PORT MAP(x,y,z,sum,c); -- architecture of the CSA
process(clock, a,b,c)
begin	
	if clock'event and clock='1' then
	    if shift = '1' then
		S <= I & S(2 downto 1);
	    end if;
	end if;
end process;

process(clock, a,b,c)
begin	
	if clock'event and clock='1' then
	    if shift = '1' then
		S <= I & S(2 downto 1);
	    end if;
	end if;
end process;

end architecture circuits; -- of add32csa
