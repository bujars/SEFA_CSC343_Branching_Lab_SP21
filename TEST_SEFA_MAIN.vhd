LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use work.SEFA_BRANCHING_PACKAGE.all;

ENTITY TEST_SEFA_MAIN IS
END TEST_sEFA_MAIN;

ARCHITECTURE ARCH_TEST OF TEST_SEFA_MAIN IS

-- The component we are testing

-- The singals. 
SIGNAL IR : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL CLK : STD_LOGIC;
SIGNAL PC : STD_LOGIC_VECTOR(31 DOWNTO 0);


CONSTANT CLK_PERIOD : TIME := 10 ns; 

BEGIN 

uut: SEFA_MAIN PORT MAP (
	SEFA_IR_REGISTER_VALUE => IR,
	SEFA_clk => CLK,
	SEFA_UPDATED_PC => PC
);

clk_process : PROCESS BEGIN

CLK <= '0';
WAIT FOR CLK_PERIOD / 2;
CLK <= '1';
WAIT FOR CLK_PERIOD / 2;
END PROCESS clk_process;

STIM_PROCESS : PROCESS
BEGIN

	WAIT FOR CLK_PERIOD;

	IR <= "00000000001000100000000000001000";
	WAIT FOR CLK_PERIOD; 
	
	--RECALL THAT WE NEEDED 3 CLOCK PERIODS TO GET THE CORRECT VALUE.
	
	
	IR <= "11111100000000000000000000001010";
	WAIT FOR CLK_PERIOD; 
--	WAIT FOR CLK_PERIOD;
--	WAIT FOR CLK_PERIOD; 
--	
	WAIT FOR 20 NS;
	
END PROCESS STIM_PROCESS;





END ARCH_TEST; 