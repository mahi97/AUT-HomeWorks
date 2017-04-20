--------------------------------------------------------------------------------
-- Author:        Mohammad Mahdi Rahimi (mohammadmahdi76@gmail.com)
--
-- Create Date:   20-04-2017
-- Module Name:   SAYEH.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity SAYEH is
	port (
		clk, externalReset : in std_logic;
		memDataReady : in std_logic;
		readMem, writeMem, readIO, writeIO : out std_logic;
		addressBus : out std_logic_vector(15 downto 0) ;
		dataBus : inout std_logic_vector(15 downto 0)
	) ;
end entity ; -- SAYEH

architecture behav of SAYEH is



begin



end architecture ; -- behav