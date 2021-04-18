library IEEE;
use IEEE.std_logic_1164.all;
use work.SEFA_BRANCHING_PACKAGE.all;


-- The purpose of this component is to select between PC+4 or PC+SignExtended(Imm16)+4 OR PC+SIGNEXTENDED(IMM26)+4
-- It must call the appropriate components that perform the addtion.

-- note putting this on pause. as this can be done directly in one file. 


-- NOTE, HERE WE HANDLE THE PC INCREMENTING LOGIC BASED ON
-- OPCODE AND RS, RT COMPARISON (FOR BEQ AND BNE)
-- OPCODE: 00000 = BEQ
-- OPCODE: 00100 = BNE
-- OPCODE: 11111 = J 


ENTITY SEFA_Branching_MUX IS
	PORT(
		SEFA_OPCODE : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		SEFA_PC_Plus_4 : IN STD_LOGIC_VECTOR(31 DOWNTo 0);
		SEFA_PC_IMM_Plus_4 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		SEFA_PC_SELECTOR : IN STD_LOGIC; 
		SEFA_PC_NEW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END SEFA_Branching_MUX;

ARCHITECTURE arch OF SEFA_Branching_MUX IS
BEGIN
	SEFA_PC_NEW <= SEFA_PC_IMM_Plus_4 WHEN 
									(SEFA_OPCODE = "111111"  -- J
									OR (SEFA_PC_SELECTOR = '1'   AND  SEFA_OPCODE = "000000"   ) -- BEQ
									OR (SEFA_PC_SELECTOR = '0' AND SEFA_OPCODE = "001100") -- BNE
									)
							ELSE SEFA_PC_Plus_4;

END arch;
