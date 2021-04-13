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
end COMPONENT SEFA_PC_REGISTER;


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


END SEFA_BRANCHING_PACKAGE;