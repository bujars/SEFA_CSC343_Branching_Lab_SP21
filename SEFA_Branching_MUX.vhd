library IEEE;
use IEEE.std_logic_1164.all;
use work.SEFA_BRANCHING_PACKAGE.all;


-- The purpose of this component is to select between PC+4 or PC+SignExtended(Imm16)+4
-- It must call the appropriate components that perform the addtion.

-- note putting this on pause. as this can be done directly in one file. 

ENTITY SEFA_Branching_MUX IS
	PORT(
		SEFA_PC_Plus_4 : IN STD_LOGIC_VECTOR(31 DOWNTo 0);
		SEFA_PC_IMM16_Plus_4 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		SEFA_PC_SELECTOR : IN STD_LOGIC; 
		SEFA_PC_NEW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END SEFA_Branching_MUX;

ARCHITECTURE arch OF SEFA_Branching_MUX IS
BEGIN
	SEFA_PC_NEW <= SEFA_PC_IMM16_Plus_4 WHEN SEFA_PC_SELECTOR = '1'
							ELSE SEFA_PC_Plus_4;

END arch;
