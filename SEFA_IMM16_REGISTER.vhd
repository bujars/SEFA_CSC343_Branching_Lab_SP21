library IEEE;
use IEEE.std_logic_1164.all;
use work.SEFA_BRANCHING_PACKAGE.all;

-- the purpose of this component is to hold the 16 bit immediate value. 


entity SEFA_IMM16_REGISTER IS
	generic (SEFA_N: integer := 16); -- NOTE this is 16 bits wide, as per IMM16 (16 bits)
	port(
	SEFA_clk: in std_logic; -- clock
		SEFA_wren: in std_logic; -- write enable (if it is 0, the stored data will not change)
		SEFA_rden: in std_logic; -- read enable (only when it is 1, the stored data will be displayed to output)
		SEFA_chen: in std_logic; --  chip enable (if it is 0, the output will be undefined)
		SEFA_data: in std_logic_vector (SEFA_N-1 downto 0); -- data input
		SEFA_IMM16: out std_logic_vector(SEFA_N-1 downto 0)
		);
end SEFA_IMM16_REGISTER;


architecture arch of SEFA_IMM16_REGISTER is 

begin

	RS: SEFA_Register_N_VHDL port map (
			SEFA_clk => SEFA_clk, 
			SEFA_wren => SEFA_wren, 
			SEFA_rden => SEFA_rden, 
			SEFA_chen => SEFA_chen, 
			SEFA_data => SEFA_data, 
			SEFA_q => SEFA_IMM16
			);
	
end arch; 