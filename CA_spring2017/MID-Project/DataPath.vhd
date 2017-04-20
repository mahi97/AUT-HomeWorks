--------------------------------------------------------------------------------
-- Author:        Mohammad Mahdi Rahimi (mohammadmahdi76@gmail.com)
--
-- Create Date:   20-04-2017
-- Module Name:   ALU.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity DataPath is
  port (
	clock
  ) ;
end entity ; -- DataPath

architecture behav of DataPath is
	component AddressUnit is
	PORT (
		Rside : IN std_logic_vector (15 DOWNTO 0);
		Iside : IN std_logic_vector (7 DOWNTO 0);
		Address : OUT std_logic_vector (15 DOWNTO 0);
		clk, ResetPC, PCplusI, PCplus1 : IN std_logic;
		RplusI, Rplus0, EnablePC : IN std_logic
    );
    end component;

    component InstructionRegister is 
    PORT (
		IRLoad : IN std_logic;
		input: IN std_logic_vector (15 DOWNTO 0);
		clk : IN std_logic;
		output: OUT std_logic_vector (15 DOWNTO 0)
    );
    end component;

    component WindowPointer is 
	PORT (
		WPLoad, WPReset, WPAdd : IN std_logic;
		input: IN std_logic_vector (5 DOWNTO 0);
		clk : IN std_logic;
		output: OUT std_logic_vector (5 DOWNTO 0)
    );
    end component;

begin



end architecture ; -- behav