library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;

entity vdiv2 is
    port (
        GO: in STD_LOGIC;
        IN_N: in STD_LOGIC_VECTOR (7 downto 0);
        IN_D: in STD_LOGIC_VECTOR (7 downto 0);
        EXT_CLK: in STD_LOGIC;
        OUT_Q: out STD_LOGIC_VECTOR (7 downto 0);
        OUT_R: out STD_LOGIC_VECTOR (7 downto 0)
    );
end vdiv2;

architecture vdiv2_arch of vdiv2 is
  signal X: STD_LOGIC_VECTOR(16 downto 0);
  signal D: STD_LOGIC_VECTOR(8 downto 0);
  signal ND: STD_LOGIC_VECTOR(8 downto 0);
  signal cycle: INTEGER RANGE 0 to 18;
  
begin
  D <= '0' & IN_D;
  ND <= '0' & (-IN_D);
  OUT_R <= X(15 downto 8);
  OUT_Q <= X(7 downto 0);
  
  process is
    variable sum: STD_LOGIC_VECTOR(8 downto 0);
  begin
    wait on EXT_CLK until EXT_CLK = '1';
    if (GO = '1') then
      cycle <= 1;
      X <= "000000000" & IN_N;
    elsif (cycle = 0) then
    elsif (cycle = 17) then
      if (X(0) = '0') then
        X(15 downto 8) <= X(15 downto 8) + D(7 downto 0);
      end if;
      cycle <= 0;
    elsif (cycle mod 2 = 1) then
      X <= '0' & X(14 downto 0) & '0';
      cycle <= cycle + 1;
    else
      if ((X(1) = '1') or (cycle = 2)) then
        sum := X(16 downto 8) + ND;
      else
        sum := X(16 downto 8) + D;
      end if;
      X(15 downto 8) <= sum(7 downto 0);
      X(0) <= sum(8);
      cycle <= cycle + 1;
    end if ;
  end process;
end vdiv2_arch;
