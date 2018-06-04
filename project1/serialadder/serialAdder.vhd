library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;


entity serialAdder is
PORT ( Cin :in  std_logic;
	  A, B  :in  std_logic_vector(15 downto 0);
	  CLK   :in  std_logic; 
	  AddSum  :OUT std_logic_vector(15 downto 0);
	  Cout	:OUT std_logic);
end serialAdder;

ARCHITECTURE Structure of serialAdder is	 
	signal a_sig, b_sig, cin_sig, cout_sig, sum_sig, cout_out : std_logic;  
   
	
Component fulladd IS
   PORT ( Cin, x, y	:IN  STD_LOGIC;
	  S, Cout	:OUT STD_LOGIC);
END component; 

begin

   stage0: fulladd PORT MAP(Cin => cout_sig, x => a_sig, y => b_sig, s => sum_sig, Cout => cout_out);
   
   process 
      begin
            wait until rising_edge(CLK);        
            a_sig <= a(0);
	         b_sig <= b(0);  
	         cout_sig <= cin; 
	         addsum(0) <= sum_sig;
            cout_sig <= cout_out; 
            cout <=   cout_sig; 
            wait until rising_edge(CLK);        
            a_sig <= a(1);
	         b_sig <= b(1);  
	         cout_sig <= cin; 
	         addsum(1) <= sum_sig;
            cout_sig <= cout_out; 
            cout <=   cout_sig; 
            wait until rising_edge(CLK);        
            a_sig <= a(2);
	         b_sig <= b(2); 
	         addsum(2) <= sum_sig;
            cout_sig <= cout_out; 
            cout <=   cout_sig; 
            wait until rising_edge(CLK);        
            a_sig <= a(3);
	         b_sig <= b(3); 
	         cin_sig <= cin; 
	         addsum(3) <= sum_sig;
            cout_sig <= cout_out; 
            cout <=   cout_sig; 
            wait until rising_edge(CLK);        
            a_sig <= a(4);
	         b_sig <= b(4); 
	         cin_sig <= cin; 
	         addsum(4) <= sum_sig;
            cout_sig <= cout_out; 
            cout <=   cout_sig; 
            wait until rising_edge(CLK);        
            a_sig <= a(5);
	         b_sig <= b(5); 
	         cin_sig <= cin; 
	         addsum(5) <= sum_sig;
            cout_sig <= cout_out; 
            cout <=   cout_sig; 
            wait until rising_edge(CLK);        
            a_sig <= a(6);
	         b_sig <= b(6); 
	         cin_sig <= cin; 
	         addsum(6) <= sum_sig;
            cout_sig <= cout_out; 
            cout <=   cout_sig; 
            wait until rising_edge(CLK);        
            a_sig <= a(7);
	         b_sig <= b(7); 
	         cin_sig <= cin; 
	         addsum(7) <= sum_sig;
            cout_sig <= cout_out; 
            cout <=   cout_sig;           
            wait until rising_edge(CLK);        
            a_sig <= a(8);
	         b_sig <= b(8); 
	         cin_sig <= cin; 
	         addsum(8) <= sum_sig;
            cout_sig <= cout_out; 
            cout <=   cout_sig; 
            wait until rising_edge(CLK);        
            a_sig <= a(9);
	         b_sig <= b(9); 
	         cin_sig <= cin; 
	         addsum(9) <= sum_sig;
            cout_sig <= cout_out; 
            cout <=   cout_sig; 
            wait until rising_edge(CLK);        
            a_sig <= a(10);
	         b_sig <= b(10); 
	         cin_sig <= cin; 
	         addsum(10) <= sum_sig;
            cout_sig <= cout_out; 
            cout <=   cout_sig; 
            wait until rising_edge(CLK);        
            a_sig <= a(11);
	         b_sig <= b(11); 
	         cin_sig <= cin; 
	         addsum(11) <= sum_sig;
            cout_sig <= cout_out; 
            cout <=   cout_sig; 
            wait until rising_edge(CLK);        
            a_sig <= a(12);
	         b_sig <= b(12); 
	         cin_sig <= cin; 
	         addsum(12) <= sum_sig;
            cout_sig <= cout_out; 
            cout <=   cout_sig; 
            wait until rising_edge(CLK);        
            a_sig <= a(13);
	         b_sig <= b(13); 
	         cin_sig <= cin; 
	         addsum(13) <= sum_sig;
            cout_sig <= cout_out; 
            cout <=   cout_sig; 
            wait until rising_edge(CLK);        
            a_sig <= a(14);
	         b_sig <= b(14); 
	         cin_sig <= cin; 
	         addsum(14) <= sum_sig;
            cout_sig <= cout_out; 
            cout <=   cout_sig; 
            wait until rising_edge(CLK);        
            a_sig <= a(15);
	         b_sig <= b(15); 
	         cin_sig <= cin; 
	         addsum(15) <= sum_sig;
            cout_sig <= cout_out; 
            cout <=   cout_sig; 
   end process; 
END Structure;	
