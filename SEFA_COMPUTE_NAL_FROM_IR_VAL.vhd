library IEEE;
use IEEE.std_logic_1164.all;
use work.SEFA_BRANCHING_PACKAGE.all;

-- the purpose of this file is to control getting the inputs and storing outputs from and to RAM.
-- we manually address RS, RT, PC, and IR. 
-- from there, we get the values and send them to the comparator 
-- from there, we call NAL 
-- and return the new address to be stored in IR. 


-- lets manually assign address 0 to PC 
-- address 1 to rs
-- address 2 to RT
-- address 3 to IR. 


-- -sctratch that. Here we pull out the value from the IR register, ie get RS and RT.
-- From there, we send it to the comparator  -- to get the condiiton value
-- from there, we call nal, and get the new address (which we store in PC)



ENTITY SEFA_COMPUTE_NAL_FROM_IR_VAL IS 
PORT(
	SEFA_IR_REGISTER_VALUE : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	SEFA_clk : IN STD_LOGIC;
	SEFA_wren: in std_logic; -- write enable (if it is 0, the stored data will not change)
	SEFA_rden: in std_logic; -- read enable (only when it is 1, the stored data will be displayed to output)
	SEFA_chen: in std_logic; --  chip enable (if it is 0, the output will be undefined)
	
	SEFA_PC_NEW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- uSING THIS FOR NOW B/C
	-- IM NOT SURE WHAT THE OUTPUT IS SUPPOSED TO BE. 
	
);
END SEFA_COMPUTE_NAL_FROM_IR_VAL;


ARCHITECTURE arch OF SEFA_COMPUTE_NAL_FROM_IR_VAL IS

-- VALUES TO PULL FROM IR REGISTER
SIGNAL OPCODE : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL RS_ADDRESS : STD_LOGIC_VECTOR(4 DOWNTO 0); 
SIGNAL RT_ADDRESS : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL IMM16_VAL : STD_LOGIC_VECTOR(15 DOWNTO 0);


-- VALUES TO PULL FROM RAM
SIGNAL RS_VALUE : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL RT_VALUE : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL PC_VALUE : STD_LOGIC_VECTOR(31 DOWNTO 0);

-- comparator value
SIGNAL PC_COND : STD_LOGIC;


BEGIN
	OPCODE <= SEFA_IR_REGISTER_VALUE(31 DOWNTO 26);
	RS_ADDRESS <= SEFA_IR_REGISTER_VALUE(25 DOWNTO 21);
	RS_ADDRESS <= SEFA_IR_REGISTER_VALUE(20 DOWNTO 16);
	IMM16_VAL <= SEFA_IR_REGISTER_VALUE(25 DOWNTO 21);
	
	GET_PC_VALUE: SEFA_INSTRUCTION_MEMORY PORT MAP (
		address => "00000", -- storing PC in default address.
		clock => SEFA_clk,
		data => X"00000000", -- arbitrary because we are reading
		wren => '0',
		q => PC_VALUE
		
	);
	
	
	GET_RS_VALUE: SEFA_INSTRUCTION_MEMORY PORT MAP (
		address => RS_ADDRESS,
		clock => SEFA_clk,
		data => x"00000000", -- NOTE THIS IS ANY ARBITRARY DATA BECAUSE WE AREN'T WRITING TO IT. ONLY READING RS!
		wren => '0',
		q => RS_VALUE; 
	);
	
	GET_RT_VALUE: SEFA_INSTRUCTION_MEMORY PORT MAP (
		address => RT_ADDRESS,
		clock => SEFA_clk,
		data => x"00000000", -- NOTE THIS IS ANY ARBITRARY DATA BECAUSE WE AREN'T WRITING TO IT. ONLY READING RT!
		wren => '0',
		q => RT_VALUE; 
	);
	
	
	-- AFTER GETTING RS AND RT, COMPARE THEIR VALUES TO SET CONDITION
	COMPUTE_RS_RT_COMPARE : SEFA_Comparator_N PORT MAP (
		SEFA_IN0 => RS_VALUE, 
		SEFA_IN1 => RT_VALUE,
		SEFA_OUT => PC_COND
	
	);
	
	-- USING CONDITION AND PC, UPDATE THE NEW PC.
	COMPUTE_NAL : SEFA_NAL PORT MAP (
		SEFA_PC_COND => PC_COND, 
		SEFA_PC_OLD => PC_VALUE,
		SEFA_IMM16 => IMM16_VAL,
		SEFA_PC_NEW => SEFA_PC_NEW
	);
	
	
END SEFA_INSTRUCTION_MEMORY;

	

END arch; 