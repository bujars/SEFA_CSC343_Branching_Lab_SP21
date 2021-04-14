library IEEE;
use IEEE.std_logic_1164.all;
use work.SEFA_BRANCHING_PACKAGE.all;

-- THE PURPOSE OF THIS COMPONENT IS TO SET THE FIELDS
-- OF DATA
-- THAT IS OPCODE | RS | RT | IMM16
-- we also might be able to avoid this file and do ir directly in IR_register (this mightve been easier lol)
-- but im using ir register just for the sake of storing (read/write) data



ENTITY SEFA_IR_REGISTER_DRIVER IS
PORT (
		SEFA_OPCODE : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		SEFA_RS_REGISTER_ADDRESS : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		SEFA_RT_REGISTER_ADDRESS : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		SEFA_IMMEDIATE16_VALUE : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		
		-- note I might make these values default. 
		SEFA_clk : in std_logic; 
		SEFA_wren: in std_logic; -- write enable (if it is 0, the stored data will not change)
		SEFA_rden: in std_logic; -- read enable (only when it is 1, the stored data will be displayed to output)
		SEFA_chen: in std_logic; --  chip enable (if it is 0, the output will be undefined)
		
		
		
		SEFA_IR_REGISTER_VALUE : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
);
END SEFA_IR_REGISTER_DRIVER;

ARCHITECTURE arch OF SEFA_IR_REGISTER_DRIVER IS

SIGNAL SEFA_IR_VALUE : STD_LOGIC_VECTOR(31 DOWNTO 0);


BEGIN
	SEFA_IR_VALUE <= SEFA_OPCODE & SEFA_RS_REGISTER_ADDRESS & SEFA_RT_REGISTER_ADDRESS & SEFA_IMMEDIATE16_VALUE; 
	IR_REGISTER: sEFA_IR_REGISTER PORT MAP (
		SEFA_clk => SEFA_clk,
		SEFA_wren => SEFA_wren,
		SEFA_rden => SEFA_rden,
		SEFA_chen => SEFA_chen, 
		SEFA_data => SEFA_IR_VALUE,
		SEFA_IR => SEFA_IR_REGISTER_VALUE

		);

END arch;

