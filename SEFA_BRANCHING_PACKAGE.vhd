library IEEE;
use IEEE.std_logic_1164.all;

PACKAGE SEFA_BRANCHING_PACKAGE IS 


COMPONENT SEFA_Register_N_VHDL is 
	generic (SEFA_N: integer := 32);
	port (
		SEFA_clk: in std_logic; 
		SEFA_wren: in std_logic;
		SEFA_rden: in std_logic;
		SEFA_chen: in std_logic; 
		SEFA_data: in std_logic_vector (SEFA_N-1 downto 0);
		SEFA_q: out std_logic_vector(SEFA_N-1 downto 0)
		);
end COMPONENT SEFA_Register_N_VHDL;

COMPONENT SEFA_RS_REGISTER IS
	generic (SEFA_N: integer := 32);
	port(
	SEFA_clk: in std_logic;
		SEFA_wren: in std_logic;
		SEFA_rden: in std_logic;
		SEFA_chen: in std_logic;
		SEFA_data: in std_logic_vector (SEFA_N-1 downto 0);
		SEFA_RS: out std_logic_vector(SEFA_N-1 downto 0)
		);
end COMPONENT SEFA_RS_REGISTER;

COMPONENT SEFA_RT_REGISTER IS
	generic (SEFA_N: integer := 32);
	port(
	SEFA_clk: in std_logic;
		SEFA_wren: in std_logic;
		SEFA_rden: in std_logic;
		SEFA_chen: in std_logic;
		SEFA_data: in std_logic_vector (SEFA_N-1 downto 0);
		SEFA_RT: out std_logic_vector(SEFA_N-1 downto 0)
		);
end COMPONENT SEFA_RT_REGISTER;


COMPONENT SEFA_PC_REGISTER IS
	generic (SEFA_N: integer := 32);
	port(
	SEFA_clk: in std_logic;
		SEFA_wren: in std_logic;
		SEFA_rden: in std_logic;
		SEFA_chen: in std_logic;
		SEFA_data: in std_logic_vector (SEFA_N-1 downto 0);
		SEFA_PC: out std_logic_vector(SEFA_N-1 downto 0)
		);
end COMPONENT SEFA_PC_REGISTER;

COMPONENT SEFA_IMM16_REGISTER IS
	generic (SEFA_N: integer := 16);
	port(
	SEFA_clk: in std_logic;
		SEFA_wren: in std_logic;
		SEFA_rden: in std_logic;
		SEFA_chen: in std_logic;
		SEFA_data: in std_logic_vector (SEFA_N-1 downto 0);
		SEFA_IMM16: out std_logic_vector(SEFA_N-1 downto 0)
		);
end COMPONENT SEFA_IMM16_REGISTER;


COMPONENT SEFA_IR_REGISTER IS
	generic (SEFA_N: integer := 32);
	port(
	SEFA_clk: in std_logic;
		SEFA_wren: in std_logic;
		SEFA_rden: in std_logic;
		SEFA_chen: in std_logic;
		SEFA_data: in std_logic_vector (SEFA_N-1 downto 0);
		SEFA_IR: out std_logic_vector(SEFA_N-1 downto 0)
		);
end COMPONENT SEFA_IR_REGISTER;


COMPONENT SEFA_LPM_ADD_SUB IS
	PORT
	(
		SEFA_add_sub		: IN STD_LOGIC ;
		SEFA_dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		SEFA_datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		SEFA_overflow		: OUT STD_LOGIC ;
		SEFA_result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END COMPONENT SEFA_LPM_ADD_SUB;


COMPONENT SEFA_PC_PLUS_IMMEDIATE_PLUS_4 IS
	PORT(
		SEFA_PC_PLUS_4 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		SEFA_SIGN_EXTENDED_IMM : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		SEFA_PC_NEW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT SEFA_PC_PLUS_IMMEDIATE_PLUS_4;


COMPONENT SEFA_PC_PLUS_4 IS
	PORT(
		SEFA_PC_OLD : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		SEFA_PC_NEW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT SEFA_PC_PLUS_4;


COMPONENT SEFA_Comparator_N IS
	GENERIC(SEFA_N : INTEGER := 32);
	PORT(
			SEFA_IN0, SEFA_IN1 : IN STD_LOGIC_VECTOR(SEFA_N-1 DOWNTO 0);
			SEFA_OUT : OUT STD_LOGIC
	);
end COMPONENT SEFA_Comparator_N;



COMPONENT SEFA_IR_REGISTER_DRIVER IS
PORT (
--		SEFA_OPCODE : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
--		SEFA_RS_REGISTER_ADDRESS : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
--		SEFA_RT_REGISTER_ADDRESS : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
--		SEFA_IMMEDIATE16_VALUE : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
--		
		-- note I might make these values default. 
		SEFA_clk : in std_logic; 
--		SEFA_wren: in std_logic; -- write enable (if it is 0, the stored data will not change)
--		SEFA_rden: in std_logic; -- read enable (only when it is 1, the stored data will be displayed to output)
--		SEFA_chen: in std_logic; --  chip enable (if it is 0, the output will be undefined)
--		
--		
--		
--		SEFA_IR_REGISTER_VALUE : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		SEFA_PC_NEW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) -- NOT SURE WHAT THE OUTPUT IS SUPPOSED TO BE. BUT WE CAN OUTPUT THIS. 
);
END COMPONENT SEFA_IR_REGISTER_DRIVER;


COMPONENT SEFA_NAL IS
PORT(
		SEFA_PC_COND : IN STD_LOGIC;
		SEFA_PC_OLD : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		SEFA_IMM16 : IN STD_LOGIC_VECTOR(15 DOWNTO 0); -- NOTE THIS IS 16 BITS AND WE NEED TO SIGN EXTEND! 
		SEFA_PC_NEW_OUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);
END COMPONENT SEFA_NAL;



COMPONENT SEFA_INSTRUCTION_MEMORY IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END COMPONENT SEFA_INSTRUCTION_MEMORY;


COMPONENT SEFA_COMPUTE_NAL_FROM_IR_VAL IS 
PORT(
	SEFA_IR_REGISTER_VALUE : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	SEFA_clk : IN STD_LOGIC;
--	SEFA_wren: in std_logic; -- write enable (if it is 0, the stored data will not change)
--	SEFA_rden: in std_logic; -- read enable (only when it is 1, the stored data will be displayed to output)
--	SEFA_chen: in std_logic; --  chip enable (if it is 0, the output will be undefined)
	
	SEFA_PC_NEW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) -- uSING THIS FOR NOW B/C
	-- IM NOT SURE WHAT THE OUTPUT IS SUPPOSED TO BE. 
);
END COMPONENT SEFA_COMPUTE_NAL_FROM_IR_VAL;

COMPONENT SEFA_SIGN_EXTEND_IMM_16_TO_32 IS
PORT (
		SEFA_IMM16 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		SEFA_IMM32 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);
END COMPONENT SEFA_SIGN_EXTEND_IMM_16_TO_32;

COMPONENT SEFA_Branching_MUX IS
	PORT(
		SEFA_PC_Plus_4 : IN STD_LOGIC_VECTOR(31 DOWNTo 0);
		SEFA_PC_IMM16_Plus_4 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		SEFA_PC_SELECTOR : IN STD_LOGIC; 
		SEFA_PC_NEW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT SEFA_Branching_MUX;


END SEFA_BRANCHING_PACKAGE;