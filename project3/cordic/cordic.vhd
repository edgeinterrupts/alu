-------------------------------------------------------------------------
-- Title        CORDIC calculater sin(x), cos(x), atan(y/x)           --
-- File         CORDIC.vhd                                            --
-- Entity       CORDIC
-- Author       Omer Farooq                                           --
        -- Input/Output Data format = Fixed Point Value
        --     range -1.99994 to 1.99994 2's complement
        -- 07  06  05  04  03  02  01  00
        -- Sign   ^point  
------------------------------------------------------------------------
library ieee ;
use ieee.std_logic_1164.all ;
use IEEE.std_logic_signed.all ;


entity CORDIC is
    port(
      IN_X         : in    std_logic_vector(7 downto 0) ;
      IN_Y         : in    std_logic_vector(7 downto 0) ;
      IN_Z         : in    std_logic_vector(7 downto 0) ;
		Trigger      : in    std_logic_vector(2 downto 0); 
		OUT_X        : out   std_logic_vector(7 downto 0) ;
		OUT_Y        : out   std_logic_vector(7 downto 0) ;
		OUT_Z        : out   std_logic_vector(7 downto 0)  
    );
end CORDIC ;

architecture RTL of CORDIC is
-----------------------------------------------------------
-- Signals                                               --
-----------------------------------------------------------
signal  REG_X         : std_logic_vector(7 downto 0) ;   -- Xn Register
signal  REG_Y         : std_logic_vector(7 downto 0) ;   -- Yn Register
signal  REG_Z         : std_logic_vector(7 downto 0) ;   -- Zn Register

-----------------------------------------------------------
-- Begin                                                 --
-----------------------------------------------------------
begin 

	-- Main Process
    process(Trigger)
	
    -- Variables 
    variable  ATAN00  : std_logic_vector(7 downto 0) := "00110010" ; -- atan(1/1)
    variable  ATAN01  : std_logic_vector(7 downto 0) := "00011101" ; -- atan(1/2)
    variable  ATAN02  : std_logic_vector(7 downto 0) := "00001111" ; -- atan(1/4)
    variable  ATAN03  : std_logic_vector(7 downto 0) := "00000111" ; -- atan(1/8)
    variable  ATAN04  : std_logic_vector(7 downto 0) := "00000011" ; -- atan(1/16)
    variable  ATAN05  : std_logic_vector(7 downto 0) := "00000010" ; -- atan(1/32)
    variable  ATAN06  : std_logic_vector(7 downto 0) := "00000001" ; -- atan(1/64)
   
    -- Temp Processing Registers	
    variable VAR_REG_X       : std_logic_vector(7 downto 0) := "00000000";
    variable VAR_REG_Y       : std_logic_vector(7 downto 0) := "00000000";
    variable VAR_REG_Z       : std_logic_vector(7 downto 0) := "00000000";
    variable VAR_REG_X_TEMP  : std_logic_vector(7 downto 0) := "00000000";
    variable VAR_REG_Y_TEMP  : std_logic_vector(7 downto 0) := "00000000";
    Variable ADD_SUB         : std_logic := '0';
	Variable add_flag        : std_logic := '0';
	
	-- begin process
	begin

	
	--Add_Flag := '1';
	ADD_SUB  := '0';
	VAR_REG_X_TEMP := "00000000";
    VAR_REG_Y_TEMP := "00000000";
	VAR_REG_X :=  IN_X;
    VAR_REG_Y :=  IN_Y;
    VAR_REG_Z :=  IN_Z;

	if(Trigger = "010" or Trigger = "011") then  --multiplication and division table: e^-i
    	ATAN00 := "01000000" ;
		ATAN01 := "00100000" ; 
    	ATAN02 := "00010000" ;
    	ATAN03 := "00001000" ; 
    	ATAN04 := "00000100" ;  
	   ATAN05 := "00000010" ; 
		ATAN06 := "00000001" ;
	else						-- other functions.
    	ATAN00 := "00110010" ;
		ATAN01 := "00011101" ; 
    	ATAN02 := "00001111" ;
    	ATAN03 := "00000111" ; 
    	ATAN04 := "00000011" ;  
	   ATAN05 := "00000011" ; 
		ATAN06 := "00000001" ;
	end if;
	-- Note: add_flag:0 equal convergence to z otherwise to y.
   	CASE Trigger is 
		When "011"  => ADD_FLAG := '1';  -- division
		When "101"  => ADD_FLAG := '1';  -- ln
		When "110"  => ADD_FLAG := '1';	--  sqrt
        when OTHERS => ADD_FLAG := '0';  -- multiplication, cos, sin, e^(Z)
	END CASE; 
	
   if(ADD_FLAG = '1') then 
		ADD_SUB := VAR_REG_Y(7);	
   else
		ADD_SUB := VAR_REG_Z(7);
   end if;

   	-- iteration# 0
   if(ADD_SUB ='1') then
		VAR_REG_X_TEMP := VAR_REG_X  +  VAR_REG_Y;
		VAR_REG_Y_TEMP := VAR_REG_Y  -  VAR_REG_X;
		VAR_REG_Z      := VAR_REG_Z  +  ATAN00; 
		VAR_REG_X      := VAR_REG_X_TEMP; 
		VAR_REG_Y      := VAR_REG_Y_TEMP;
	else
		VAR_REG_X_TEMP := VAR_REG_X  -  VAR_REG_Y;
		VAR_REG_Y_TEMP := VAR_REG_Y  +  VAR_REG_X;
		VAR_REG_Z      := VAR_REG_Z  -  ATAN00; 
		VAR_REG_X      := VAR_REG_X_TEMP; 
		VAR_REG_Y      := VAR_REG_Y_TEMP;
   end if;
   if(ADD_FLAG = '1') then 
		ADD_SUB := VAR_REG_Y(7);	
   else
		ADD_SUB := VAR_REG_Z(7);
   end if;

	-- iteration# 1 
   if(ADD_SUB ='1') then
		VAR_REG_X_TEMP := VAR_REG_X  +  (VAR_REG_Y(7) & VAR_REG_Y(7 downto 1));
		VAR_REG_Y_TEMP := VAR_REG_Y  -  (VAR_REG_X(7) & VAR_REG_X(7 downto 1));
		VAR_REG_Z      := VAR_REG_Z  +  ATAN01; 
		VAR_REG_X      := VAR_REG_X_TEMP; 
		VAR_REG_Y      := VAR_REG_Y_TEMP;
	else
		VAR_REG_X_TEMP := VAR_REG_X  -  (VAR_REG_Y(7) & VAR_REG_Y(7 downto 1));
		VAR_REG_Y_TEMP := VAR_REG_Y  +  (VAR_REG_X(7) & VAR_REG_X(7 downto 1));
		VAR_REG_Z      := VAR_REG_Z  -  ATAN01; 
		VAR_REG_X      := VAR_REG_X_TEMP; 
		VAR_REG_Y      := VAR_REG_Y_TEMP;
   end if;
   if(ADD_FLAG = '1') then 
		ADD_SUB := VAR_REG_Y(7);	
   else
		ADD_SUB := VAR_REG_Z(7);
   end if;

	-- iteration# 2 
   if(ADD_SUB ='1') then
		VAR_REG_X_TEMP := VAR_REG_X  +  (VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7 downto 2));
		VAR_REG_Y_TEMP := VAR_REG_Y  -  (VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7 downto 2));
		VAR_REG_Z      := VAR_REG_Z  +  ATAN02; 
		VAR_REG_X      := VAR_REG_X_TEMP; 
		VAR_REG_Y      := VAR_REG_Y_TEMP;
	else
		VAR_REG_X_TEMP := VAR_REG_X  -  (VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7 downto 2));
		VAR_REG_Y_TEMP := VAR_REG_Y  +  (VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7 downto 2));
		VAR_REG_Z      := VAR_REG_Z  -  ATAN02; 
		VAR_REG_X      := VAR_REG_X_TEMP; 
		VAR_REG_Y      := VAR_REG_Y_TEMP;
   end if;
   if(ADD_FLAG = '1') then 
		ADD_SUB := VAR_REG_Y(7);	
   else
		ADD_SUB := VAR_REG_Z(7);
   end if;

	-- Iteration# 3 
   if(ADD_SUB ='1') then
		VAR_REG_X_TEMP := VAR_REG_X  +  (VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7 downto 3));
		VAR_REG_Y_TEMP := VAR_REG_Y  -  (VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7 downto 3));
		VAR_REG_Z      := VAR_REG_Z  +  ATAN03; 
		VAR_REG_X      := VAR_REG_X_TEMP; 
		VAR_REG_Y      := VAR_REG_Y_TEMP;
	else
		VAR_REG_X_TEMP := VAR_REG_X  -  (VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7 downto 3));
		VAR_REG_Y_TEMP := VAR_REG_Y  +  (VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7 downto 3));
		VAR_REG_Z      := VAR_REG_Z  -  ATAN03; 
		VAR_REG_X      := VAR_REG_X_TEMP; 
		VAR_REG_Y      := VAR_REG_Y_TEMP;
   end if;
   if(ADD_FLAG = '1') then 
		ADD_SUB := VAR_REG_Y(7);	
   else
		ADD_SUB := VAR_REG_Z(7);
   end if;

	-- iteration# 4 
   if(ADD_SUB ='1') then
		VAR_REG_X_TEMP := VAR_REG_X  +  (VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7 downto 4));
		VAR_REG_Y_TEMP := VAR_REG_Y  -  (VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7 downto 4));
		VAR_REG_Z      := VAR_REG_Z  +  ATAN04; 
		VAR_REG_X      := VAR_REG_X_TEMP; 
		VAR_REG_Y      := VAR_REG_Y_TEMP;
	else
		VAR_REG_X_TEMP := VAR_REG_X  -  (VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7 downto 4));
		VAR_REG_Y_TEMP := VAR_REG_Y  +  (VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7 downto 4));
		VAR_REG_Z      := VAR_REG_Z  -  ATAN04; 
		VAR_REG_X      := VAR_REG_X_TEMP; 
		VAR_REG_Y      := VAR_REG_Y_TEMP;
   end if;
   if(ADD_FLAG = '1') then 
		ADD_SUB := VAR_REG_Y(7);	
   else
		ADD_SUB := VAR_REG_Z(7);
   end if;

	-- iteration# 5 
   if(ADD_SUB ='1') then
		VAR_REG_X_TEMP := VAR_REG_X  +  (VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7 downto 5));
		VAR_REG_Y_TEMP := VAR_REG_Y  -  (VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7 downto 5));
		VAR_REG_Z      := VAR_REG_Z  +  ATAN05; 
		VAR_REG_X      := VAR_REG_X_TEMP; 
		VAR_REG_Y      := VAR_REG_Y_TEMP;
	else
		VAR_REG_X_TEMP := VAR_REG_X  -  (VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7 downto 5));
		VAR_REG_Y_TEMP := VAR_REG_Y  +  (VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7 downto 5));
		VAR_REG_Z      := VAR_REG_Z  -  ATAN05; 
		VAR_REG_X      := VAR_REG_X_TEMP; 
		VAR_REG_Y      := VAR_REG_Y_TEMP;
   end if;
   if(ADD_FLAG = '1') then 
		ADD_SUB := VAR_REG_Y(7);	
   else
		ADD_SUB := VAR_REG_Z(7);
   end if;

	-- Iteration# 6 
   if(ADD_SUB ='1') then
		VAR_REG_X_TEMP := VAR_REG_X  +  (VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7 downto 6));
		VAR_REG_Y_TEMP := VAR_REG_Y  -  (VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7 downto 6));
		VAR_REG_Z      := VAR_REG_Z  +  ATAN06; 
		VAR_REG_X      := VAR_REG_X_TEMP; 
		VAR_REG_Y      := VAR_REG_Y_TEMP;
	else
		VAR_REG_X_TEMP := VAR_REG_X  -  (VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7) & VAR_REG_Y(7 downto 6));
		VAR_REG_Y_TEMP := VAR_REG_Y  +  (VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7) & VAR_REG_X(7 downto 6));
		VAR_REG_Z      := VAR_REG_Z  -  ATAN06; 
		VAR_REG_X      := VAR_REG_X_TEMP; 
		VAR_REG_Y      := VAR_REG_Y_TEMP;
   end if;
	
   REG_X <= VAR_REG_X;  
   REG_Y <= VAR_REG_Y;  
   REG_Z <= VAR_REG_Z; 
  
end process ;
 
	OUT_X      <= REG_X ;
   OUT_Y      <= REG_Y ;
   OUT_Z      <= REG_Z;
	
end RTL ;


