--RichiSoft

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;
				 			
entity memoriaInstruc is
	 port(
		 address : in STD_LOGIC_VECTOR(63 downto 0);
		 instruccion : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end memoriaInstruc;

--}} End of automatically maintained section

architecture memoriaInstruc of memoriaInstruc is
type localidad is array (0 to 15) of STD_LOGIC_VECTOR	(31 downto 0);
signal instrucciones: localidad := (
	x"8B040023",		   	--ADD X3,X1,X4
	x"CB0400C7",		   	--SUB X7,X6,X4
	x"9100204B",		   	--ADDI X8,X2,#8
	x"D1001469",			--SUBI X9,X3,#5
	x"8A030041",		   	--AND X1,X2,X3
	x"AA0600A4",			--OR X4,X5,X6
	x"92002907",			--ANDI X7,X8,#10
	x"B2003149",			--ORI X9,X10,#12
	x"F84000E3",			--LDUR X3, [X7,#0]
	x"F800006A",			--STUR X10, [X7,#0]
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000"
);
begin	 
	process(address)
	begin
		instruccion <= instrucciones(CONV_INTEGER(address(5 downto 2)));
	end process;
end memoriaInstruc;