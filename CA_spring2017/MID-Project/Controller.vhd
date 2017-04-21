--------------------------------------------------------------------------------
-- Author:        Mohammad Mahdi Rahimi (mohammadmahdi76@gmail.com)
--
-- Create Date:   20-04-2017
-- Module Name:   Controller.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity Controller is
	port (
		clk, ext_reset : in std_logic;
		memDataReady : in std_logic;
		Zout, Cout : in std_logic; -- Flags
		IRout : in std_logic_vector(15 downto 0) ; -- instruction
		IRLoad : out std_logic; -- instruction register
		CSet, CReset, ZSet, ZReset, SRload : out std_logic; -- Flags
		WPAdd, WPReset, WPLoad : out std_logic; -- Window Pointer
		ResetPC, PCplus1, PCplusI, Rplus0, RplusI, EnablePC : out std_logic; -- Address Unit
		opcode : out std_logic_vector(3 downto 0) ; -- ALU
		shadow : out std_logic; -- shadow instruction
		RFSWrite, RFDWrite : out std_logic; -- register file
		readMem, writeMem, readIO, writeIO : out std_logic; -- memory and IO
		ALUOut_on_dataBus : out std_logic; -- ALU
		RS_on_addressUnit_RSide, RD_on_addressUnit_RSide : out std_logic; -- register file
		Address_on_dataBus : out std_logic
	) ;
end entity ; -- Controller

architecture RTL of Controller is
	type state is (S0, S1, S2, S3, S4);
	signal current_state : state;
	signal next_state : state;
begin
	-- next to current
	process (clk, ext_reset)
	begin
		if ext_reset = '1' then
			current_state <= S0;
		elsif clk'event and clk = '1' then
			current_state <= next_state;
		end if;
	end process;

	-- next based on state
	process (current_state)
	begin
		case current_state is
			when S0 =>
				
			when S1 =>
				
			when S2 =>
			when S3 =>
			when S4 =>
		end case;
	end process;
end architecture ; -- RTL