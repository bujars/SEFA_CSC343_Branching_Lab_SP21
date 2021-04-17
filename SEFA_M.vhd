--library IEEE;
--use IEEE.std_logic_1164.all;
--use work.SEFA_BRANCHING_PACKAGE.all;
--
--
--
--ENTITY SEFA_M IS 
--PORT(
--	SEFA_IR_REGISTER_VALUE : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--	SEFA_clk : IN STD_LOGIC;
--	
--	SEFA_PC_NEW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) -- uSING THIS FOR NOW B/C
--	-- IM NOT SURE WHAT THE OUTPUT IS SUPPOSED TO BE. 
--);
--END SEFA_M;
--
--
--ARCHITECTURE arch OF SEFA_M IS
--
---- VALUES TO PULL FROM IR REGISTER
--	SIGNAL OPCODE : STD_LOGIC_VECTOR(5 DOWNTO 0);
--	SIGNAL RS_ADDRESS : STD_LOGIC_VECTOR(4 DOWNTO 0); 
--	SIGNAL RT_ADDRESS : STD_LOGIC_VECTOR(4 DOWNTO 0);
--	SIGNAL IMM16_VAL : STD_LOGIC_VECTOR(15 DOWNTO 0);
--
--
---- VALUES TO PULL FROM RAM
--	SIGNAL RS_VALUE : STD_LOGIC_VECTOR(31 DOWNTO 0);
--	SIGNAL RT_VALUE : STD_LOGIC_VECTOR(31 DOWNTO 0);
--	SIGNAL PC_VALUE : STD_LOGIC_VECTOR(31 DOWNTO 0);
--
--
--BEGIN
--	OPCODE <= SEFA_IR_REGISTER_VALUE(31 DOWNTO 26);
--	RS_ADDRESS <= SEFA_IR_REGISTER_VALUE(25 DOWNTO 21);
--	RT_ADDRESS <= SEFA_IR_REGISTER_VALUE(20 DOWNTO 16);
--	IMM16_VAL <= SEFA_IR_REGISTER_VALUE(15 DOWNTO 0);
--	
--	GET_PC_VALUE: SEFA_INSTRUCTION_MEMORY PORT MAP (
--		address => "00000", -- THE PC IS default address HERE! MUST BE CONSISTENT ON ALL FILES THAT PULL IT OR NEED THE ADDRESS. 
--		clock => SEFA_clk,
--		data => "00000000000000000000000000000000", -- arbitrary because we are reading
--		wren => '0',
--		q => PC_VALUE
--		
--	);
--	
--	GET_RS_VALUE: SEFA_INSTRUCTION_MEMORY PORT MAP (
--		address => RS_ADDRESS,
--		clock => SEFA_clk,
--		data => "00000000000000000000000000000000", -- NOTE THIS IS ANY ARBITRARY DATA BECAUSE WE AREN'T WRITING TO IT. ONLY READING RS!
--		wren => '0',
--		q => RS_VALUE
--	);
--	
--	GET_RT_VALUE: SEFA_INSTRUCTION_MEMORY PORT MAP (
--		address => RT_ADDRESS,
--		clock => SEFA_clk,
--		data => "00000000000000000000000000000000", -- NOTE THIS IS ANY ARBITRARY DATA BECAUSE WE AREN'T WRITING TO IT. ONLY READING RT!
--		wren => '0',
--		q => RT_VALUE
--	);
--	
--	CN:  SEFA_COMPUTE_NAL_FROM_IR_VAL PORT MAP ( RS_VALUE => RS_VALUE, RT_VALUE => RT_VALUE, PC_VALUE => PC_VALUE, IMM16_VAL => IMM16_VAL, SEFA_PC_NEW => SEFA_PC_NEW ); 
--	
--
--END arch; 