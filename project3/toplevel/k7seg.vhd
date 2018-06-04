-- File:				K7Seg.vhd
-- Description:			Hex-to-Seven-Segment Decoder
-- Author:				Dorin Patru
-- Date:				2004

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY k7seg is
	Port
	(
		DIN :	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		DOUT:	OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END k7seg;

ARCHITECTURE BEH of k7seg is
begin

DOUT <=	"1111110" WHEN (DIN = "0000") ELSE
		"0110000" WHEN (DIN = "0001") ELSE
		"1101101" WHEN (DIN = "0010") ELSE
		"1111001" WHEN (DIN = "0011") ELSE
		"0110011" WHEN (DIN = "0100") ELSE
		"1011011" WHEN (DIN = "0101") ELSE
		"1011111" WHEN (DIN = "0110") ELSE
		"1110000" WHEN (DIN = "0111") ELSE
		"1111111" WHEN (DIN = "1000") ELSE
		"1111011" WHEN (DIN = "1001") ELSE
		"1110111" WHEN (DIN = "1010") ELSE
		"0011111" WHEN (DIN = "1011") ELSE
		"1001110" WHEN (DIN = "1100") ELSE
		"0111101" WHEN (DIN = "1101") ELSE
		"1001111" WHEN (DIN = "1110") ELSE
		"1000111" WHEN (DIN = "1111");
END BEH;

