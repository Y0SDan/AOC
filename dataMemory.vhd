--RichiSoft

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity dataMemory is
    port(
        address : in STD_LOGIC_VECTOR(63 downto 0);
        writeData : in STD_LOGIC_VECTOR(31 downto 0);
        memWrite : in STD_LOGIC;
        memRead : in STD_LOGIC;
        readData : out STD_LOGIC_VECTOR(31 downto 0)
    );
end dataMemory;

architecture dataMemory of dataMemory is
type localidad is array (0 to 15) of STD_LOGIC_VECTOR (31 downto 0);
signal memory: localidad := (
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000"
);
begin
    process(address, memWrite, memRead, writeData)
    begin
        if memWrite = '1' then
            memory(CONV_INTEGER(address(5 downto 2))) <= writeData;
        end if;
        if memRead = '1' then
            readData <= memory(CONV_INTEGER(address(5 downto 2)));
        end if;
    end process;
end dataMemory;