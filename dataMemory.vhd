--richi Soft

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity dataMemory is
    port(
        clk : in STD_LOGIC; -- Add clk as input
        address : in STD_LOGIC_VECTOR(63 downto 0);
        writeData : in STD_LOGIC_VECTOR(31 downto 0);
        memWrite : in STD_LOGIC;
        memRead : in STD_LOGIC;
        readData : out STD_LOGIC_VECTOR(31 downto 0)
    );
end dataMemory;

architecture dataMemory of dataMemory is
type localidad is array (0 to 63) of STD_LOGIC_VECTOR (63 downto 0); -- Changed to 64 bits
signal memory: localidad := (
    x"0000000000000000", x"0000000000000000", x"0000000000000000", x"0000000000000000",
    x"0000000000000000", x"0000000000000000", x"0000000000000000", x"0000000000000000",
    x"0000000000000000", x"0000000000000000", x"0000000000000000", x"0000000000000000",
    x"0000000000000000", x"0000000000000000", x"0000000000000000", x"0000000000000000",
    x"0000000000000000", x"0000000000000000", x"0000000000000000", x"0000000000000000",
    x"0000000000000000", x"0000000000000000", x"0000000000000000", x"0000000000000000",
    x"0000000000000000", x"0000000000000000", x"0000000000000000", x"0000000000000000",
    x"0000000000000000", x"0000000000000000", x"0000000000000000", x"0000000000000000",
    x"0000000000000000", x"0000000000000000", x"0000000000000000", x"0000000000000000",
    x"0000000000000000", x"0000000000000000", x"0000000000000000", x"0000000000000000",
    x"0000000000000000", x"0000000000000000", x"0000000000000000", x"0000000000000000",
    x"0000000000000000", x"0000000000000000", x"0000000000000000", x"0000000000000000",
    x"0000000000000000", x"0000000000000000", x"0000000000000000", x"0000000000000000",
    x"0000000000000000", x"0000000000000000", x"0000000000000000", x"0000000000000000",
    x"0000000000000000", x"0000000000000000", x"0000000000000000", x"0000000000000000",
    x"0000000000000000", x"0000000000000000", x"0000000000000000", x"0000000000000000"
);
begin
    process(clk) -- Use clk in your process
    begin
        if rising_edge(clk) and memRead = '1' then
            -- Read on rising edge of clk
            readData <= memory(CONV_INTEGER(address(5 downto 2)));
        elsif falling_edge(clk) and memWrite = '1' then
            -- Write on falling edge of clk
            memory(CONV_INTEGER(address(5 downto 2))) <= writeData;
        end if;
    end process;
end dataMemory;