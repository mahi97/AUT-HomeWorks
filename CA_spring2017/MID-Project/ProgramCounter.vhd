--------------------------------------------------------------------------------
-- Author:        Mohammad Mahdi Rahimi (mohammadmahdi76@gmail.com)
--
-- Create Date:   20-04-2017
-- Module Name:   ProgramCounter.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY ProgramCounter IS
	    PORT (
		EnablePC : IN std_logic;
		input: IN std_logic_vector (15 DOWNTO 0);
		clk : IN std_logic;
		output: OUT std_logic_vector (15 DOWNTO 0)
	    );
END ProgramCounter;

ARCHITECTURE dataflow OF ProgramCounter IS BEGIN
    PROCESS (clk) BEGIN
	if(clk='1' and clk'event) then
	    IF (EnablePC = '1') THEN
		output <= input;
	    END IF;
	END IF;
    END PROCESS;
END dataflow;