library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;
use IEEE.STD_LOGIC_ARITH.all; 
use IEEE.numeric_std.all;                                                             

entity Sign_Extend is
    port(
        ENT : in STD_LOGIC_VECTOR(31 downto 0); -- Changed to 32 bits
        SAL : out STD_LOGIC_VECTOR(63 downto 0) -- Changed to 64 bits
    );
end Sign_Extend;

architecture Sign_Extend of Sign_Extend is 

signal SALIDA:STD_LOGIC_VECTOR(63 downto 0); -- Changed to 64 bits
signal ENTRADA:STD_LOGIC_VECTOR(31 downto 0); -- Changed to 32 bits
signal ENTRADA1:STD_LOGIC_VECTOR(31 downto 0); -- Changed to 32 bits
begin
    ENTRADA <= (OTHERS => '1');
    ENTRADA1 <= (OTHERS => '0');
    process (ENT, ENTRADA, ENTRADA1)      
    BEGIN    
    if ( ENT(31) = '1' ) then -- Changed to check the 32nd bit
        SALIDA <= ENTRADA & ENT;
    else
        SALIDA <= ENTRADA1 & ENT;
    end if;
    END PROCESS;
    SAL <= SALIDA;
end Sign_Extend;