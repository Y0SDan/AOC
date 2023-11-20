	   

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;
use IEEE.STD_LOGIC_ARITH.all; 
use IEEE.numeric_std.all;

entity ADD is
	 port(
		 ADD1 : in STD_LOGIC_VECTOR(31 downto 0);
		 ADD2 : in STD_LOGIC_VECTOR(31 downto 0);
		 SAL : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end ADD;

architecture ADD of ADD is
begin
	process(ADD1, ADD2) 
	BEGIN
	 SAL <= ADD1 + ADD2;
	 END PROCESS;
end ADD;
