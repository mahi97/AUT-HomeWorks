--------------------------------------------------------------------------------
-- Author:        Mohammad Mahdi Rahimi (mohammadmahdi76@gmail.com)
--
-- Create Date:   20-04-2017
-- Module Name:   AddressLogic.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


ENTITY AddressLogic IS
	    PORT (
		PCside, Rside : IN std_logic_vector (15 DOWNTO 0);
		Iside : IN std_logic_vector (7 DOWNTO 0);
		ALout : OUT std_logic_vector (15 DOWNTO 0);
		ResetPC, PCplusI, PCplus1, RplusI, Rplus0 : IN std_logic
	    );
END AddressLogic;

ARCHITECTURE dataflow of AddressLogic IS
    CONSTANT one   : std_logic_vector (4 DOWNTO 0) := "10000";
    CONSTANT two   : std_logic_vector (4 DOWNTO 0) := "01000";
    CONSTANT three : std_logic_vector (4 DOWNTO 0) := "00100";
    CONSTANT four  : std_logic_vector (4 DOWNTO 0) := "00010";
    CONSTANT five  : std_logic_vector (4 DOWNTO 0) := "00001";
    signal result: unsigned(16 downto 0);

BEGIN
    PROCESS (PCside, Rside, Iside, ResetPC,
	    PCplusI, PCplus1, RplusI, Rplus0)
	VARIABLE temp : std_logic_vector (4 DOWNTO 0);
    BEGIN
	temp := (ResetPC & PCplusI & PCplus1 & RplusI & Rplus0);
	CASE temp IS
	    WHEN one    => result <= (OTHERS => '0');
	    WHEN two    => result <= unsigned(PCside) + unsigned(Iside);
	    WHEN three  => result <= unsigned(PCside) + 1;
	    WHEN four   => result <= unsigned(Rside)  + unsigned(Iside);
	    WHEN five   => result <= unsigned(Rside);
	    WHEN OTHERS => result <= unsigned(PCside);
	END CASE;
	ALout <= std_logic_vector(result(15 downto 0));
    END PROCESS;
END dataflow;