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

component Controller is
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
        data : out std_logic_vector(7 downto 0) ;
		Address_on_dataBus : out std_logic
	) ;
end component ; -- Controller

component DataPath is
	port (
		clk, ext_reset : in std_logic;
		Zout, Cout : out std_logic;
		IRout : out std_logic_vector(15 downto 0) ;
		IRLoad : in std_logic;
		CSet, CReset, ZSet, ZReset, SRload : in std_logic; -- Flags
		WPAdd, WPReset, WPLoad : in std_logic; -- Window Pointer
		ResetPC, PCplus1, PCplusI, Rplus0, RplusI, EnablePC : in std_logic; -- Address Unit
		opcode : in std_logic_vector(3 downto 0) ; -- ALU
		shadow : in std_logic; -- shadow instruction
		RFSWrite, RFDWrite : in std_logic; -- register file
		ALUOut_on_dataBus : in std_logic; -- ALU
		RS_on_addressUnit_RSide, RD_on_addressUnit_RSide : in std_logic; -- register file
		Address_on_dataBus : in std_logic;
        addressBus : out std_logic_vector(15 downto 0) ;
        data : in std_logic_vector(7 downto 0) ;
        dataBus : inout std_logic_vector(15 downto 0)
	) ;
end component ; -- DataPath

signal Zero, Carry : std_logic; -- flags
signal IRout : std_logic_vector(15 downto 0) ;
signal IRLoad : std_logic;
signal CSet, CReset, ZSet, ZReset, SRload : std_logic; -- Flags
signal WPAdd, WPReset, WPLoad : std_logic; -- Window Pointer
signal ResetPC, PCplus1, PCplusI, Rplus0, RplusI, EnablePC : std_logic; -- Address Unit
signal opcode : std_logic_vector(3 downto 0) ; -- ALU
signal shadow : std_logic; -- shadow instruction
signal RFSWrite, RFDWrite : std_logic; -- register file
signal ALUOut_on_dataBus : std_logic; -- ALU
signal RS_on_addressUnit_RSide, RD_on_addressUnit_RSide : std_logic; -- register file
signal Address_on_dataBus : std_logic;
signal ctrl_data : std_logic_vector(7 downto 0) ;

begin
	dp 	: DataPath   port map ( clk, externalReset,
                                Zero, Carry,
                                IRout,
                                IRLoad,
                                CSet, CReset, ZSet, ZReset, SRload,
                                WPAdd, WPReset, WPLoad,
                                ResetPC, PCplus1, PCplusI, Rplus0, RplusI, EnablePC,
                                opcode,
                                shadow,
                                RFSWrite, RFDWrite,
                                ALUOut_on_dataBus,
                                RS_on_addressUnit_RSide, RD_on_addressUnit_RSide,
                                Address_on_dataBus,
                                addressBus,
                                ctrl_data,
                                dataBus);

	ctl : Controller port map ( clk, externalReset,
								memDataReady,
								Zero, Carry,
								IRout,
								IRLoad,
								CSet, CReset, ZSet, ZReset, SRload,
								WPAdd, WPReset, WPLoad,
								ResetPC, PCplus1, PCplusI, Rplus0, RplusI, EnablePC,
								opcode,
								shadow,
								RFSWrite, RFDWrite,
								readMem, writeMem, readIO, writeIO,
								ALUOut_on_dataBus,
								RS_on_addressUnit_RSide, RD_on_addressUnit_RSide,
                                ctrl_data,
								Address_on_dataBus);


end architecture ; -- behav