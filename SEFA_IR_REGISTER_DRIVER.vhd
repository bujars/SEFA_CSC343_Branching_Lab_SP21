library IEEE;
use IEEE.std_logic_1164.all;
use work.SEFA_BRANCHING_PACKAGE.all;

-- THE PURPOSE OF THIS COMPONENT IS TO SET THE FIELDS
-- OF DATA
-- THAT IS OPCODE | RS | RT | IMM16
-- we also might be able to avoid this file and do ir directly in IR_register
-- but im using ir register just for the sake of storing (read/write) data



ENTITY SEFA_IR_REGISTER_DRIVER IS
PORT (
--		SEFA_OPCODE : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
--		SEFA_RS_REGISTER_ADDRESS : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
--		SEFA_RT_REGISTER_ADDRESS : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
--		SEFA_IMMEDIATE16_VALUE : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		
		-- 
		SEFA_clk : in std_logic; 
--		SEFA_wren: in std_logic; -- write enable (if it is 0, the stored data will not change)
--		SEFA_rden: in std_logic; -- read enable (only when it is 1, the stored data will be displayed to output)
--		SEFA_chen: in std_logic; --  chip enable (if it is 0, the output will be undefined)
--		
		
		
--		SEFA_IR_REGISTER_VALUE : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);


		SEFA_PC_NEW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) -- NOT SURE WHAT THE OUTPUT IS SUPPOSED TO BE. BUT WE CAN OUTPUT THIS. 
);
END SEFA_IR_REGISTER_DRIVER;

ARCHITECTURE arch OF SEFA_IR_REGISTER_DRIVER IS

	SIGNAL SEFA_IR_VALUE : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL SEFA_OPCODE : STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL SEFA_RS_REGISTER_ADDRESS : STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL SEFA_RT_REGISTER_ADDRESS : STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL SEFA_IMMEDIATE16_VALUE : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN

	-- Set the values by default. Ensure that the register rs/rt values in MIF to be equal (if you want to test the condition). 
	-- Might be easier to just pass in these values so that we can pass them through the test bench....
	-- NOTE BY DEFAULT SETTING PC ADDRESS TO "00000" -- THIS MUST BE CONSISTENT EVERYWHERE! 
	SEFA_OPCODE <= "000000";
	SEFA_RS_REGISTER_ADDRESS <= "00010";
	SEFA_RT_REGISTER_ADDRESS <= "00001";
	SEFA_IMMEDIATE16_VALUE <= "0000000000001000"; 

	-- Set the combined value that is passsed into driver. 
	SEFA_IR_VALUE <= SEFA_OPCODE & SEFA_RS_REGISTER_ADDRESS & SEFA_RT_REGISTER_ADDRESS & SEFA_IMMEDIATE16_VALUE; 

	-- we manually set the code for bne, beq
	
	
	COMPUTE_NEXT_PC : SEFA_COMPUTE_NAL_FROM_IR_VAL PORT MAP (
		SEFA_IR_REGISTER_VALUE => SEFA_IR_VALUE,
		SEFA_clk => SEFA_clk, 
		SEFA_PC_NEW => SEFA_PC_NEW
	
	
	
	);
	
	
	
--	
--		SEFA_IR_REGISTER_VALUE : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--	SEFA_clk : IN STD_LOGIC;
----	SEFA_wren: in std_logic; -- write enable (if it is 0, the stored data will not change)
----	SEFA_rden: in std_logic; -- read enable (only when it is 1, the stored data will be displayed to output)
----	SEFA_chen: in std_logic; --  chip enable (if it is 0, the output will be undefined)
--	
--	SEFA_PC_NEW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- uSING THIS FOR NOW B/C
--	-- IM NOT SURE WHAT THE OUTPUT IS SUPPOSED TO BE. 
	
	
	--	IR_REGISTER: sEFA_IR_REGISTER PORT MAP (
--		SEFA_clk => SEFA_clk,
--		SEFA_wren => SEFA_wren,
--		SEFA_rden => SEFA_rden,
--		SEFA_chen => SEFA_chen, 
--		SEFA_data => SEFA_IR_VALUE,
--		SEFA_IR => SEFA_IR_REGISTER_VALUE
--
--		);

END arch;

