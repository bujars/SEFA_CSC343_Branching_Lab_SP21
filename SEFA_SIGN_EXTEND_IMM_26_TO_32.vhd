library IEEE;
use IEEE.std_logic_1164.all;
use work.SEFA_BRANCHING_PACKAGE.all;


-- THE PURPOSE OF THIS COMPONENT IS TO SIGN EXTENDED IMMEDIATE FIELD FROM 26 BITS TO 32 BITS


ENTITY SEFA_SIGN_EXTEND_IMM_26_TO_32 IS
PORT (
		SEFA_IMM26 : IN STD_LOGIC_VECTOR(25 DOWNTO 0);
		SEFA_IMM32 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);
END SEFA_SIGN_EXTEND_IMM_26_TO_32;

ARCHITECTURE arch OF SEFA_SIGN_EXTEND_IMM_26_TO_32 IS
BEGIN
	
	SEFA_IMM32 <= "000000" & SEFA_IMM26 WHEN SEFA_IMM26(25) = '0' ELSE
						"111111" & SEFA_IMM26; 

END arch;