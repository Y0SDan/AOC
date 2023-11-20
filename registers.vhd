library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity registers is
    Port (
        clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        regWrite : in STD_LOGIC;
        readData1 : out STD_LOGIC_VECTOR(63 downto 0);
        readData2 : out STD_LOGIC_VECTOR(63 downto 0);
        writeData : in STD_LOGIC_VECTOR(63 downto 0);
        writeRegister : in STD_LOGIC_VECTOR(4 downto 0);
        readRegister1 : in STD_LOGIC_VECTOR(4 downto 0);
        readRegister2 : in STD_LOGIC_VECTOR(4 downto 0)
    );
end registers;

architecture Behavioral of registers is
    -- Arreglo con 16 espacios de memoria cada uno con una capacidad de 64 bits
    type reg_array is array (15 downto 0) of STD_LOGIC_VECTOR(63 downto 0);
    signal memory : reg_array :=
        (
            0 => "0000000000000000000000000000000000000000000000000000000000000000",
            1 => "0000000000000000000000000000000000000000000000000000000000000001",
            2 => "0000000000000000000000000000000000000000000000000000000000000010",
            3 => "0000000000000000000000000000000000000000000000000000000000000011",
            4 => "0000000000000000000000000000000000000000000000000000000000000100",
            5 => "0000000000000000000000000000000000000000000000000000000000000101",
            6 => "0000000000000000000000000000000000000000000000000000000000000110",
            7 => "0000000000000000000000000000000000000000000000000000000000000111",
            8 => "0000000000000000000000000000000000000000000000000000000000001000",
            9 => "0000000000000000000000000000000000000000000000000000000000001001",
            10 => "0000000000000000000000000000000000000000000000000000000000001010",
            11 => "0000000000000000000000000000000000000000000000000000000000001011",
            12 => "0000000000000000000000000000000000000000000000000000000000001100",
            13 => "0000000000000000000000000000000000000000000000000000000000001101",
            14 => "0000000000000000000000000000000000000000000000000000000000001110",
            15 => "0000000000000000000000000000000000000000000000000000000000001111"
        );
begin
    process(clock, reset)
    begin 
        if reset = '1' then
            -- Resetear memoria
            for i in 0 to 15 loop
              memory(i) <= std_logic_vector(to_unsigned(i, 64));
            end loop;
        elsif rising_edge(clock) then
            if regWrite = '1' then	  
                for i in 0 to 15 loop
                     if writeRegister = std_logic_vector(to_unsigned(i, 5)) then
                        memory(i) <= writeData;
                    end if;
                end loop;
            elsif regWrite = '0' then
                readData1 <= memory(to_integer(unsigned(readRegister1)));
                readData2 <= memory(to_integer(unsigned(readRegister2)));		
            end if;
        end if;
    end process;
end Behavioral;