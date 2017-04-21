--------------------------------------------------------------------------------
-- Author:        Mohammad Mahdi Rahimi (mohammadmahdi76@gmail.com)
--
-- Create Date:   20-04-2017
-- Module Name:   DataPath.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity DataPath is
    port (
        clk, ext_reset : in std_logic;
        Zout, Cout : out std_logic;
        IRout : out std_logic_vector(15 downto 0) ;
        IRLoad : in std_logic;
        CSet, CReset, ZSet, ZReset, SRload : in std_logic; -- Flags
        WPAdd, WPReset : in std_logic; -- Window Pointer
        ResetPC, PCplus1, PCplusI, Rplus0, RplusI, EnablePC : in std_logic; -- Address Unit
        opcode : in std_logic_vector(3 downto 0) ; -- ALU
        shadow : in std_logic; -- shadow instruction
        RFSWrite, RFDWrite : in std_logic; -- register file
        ALUOut_on_dataBus : in std_logic; -- ALU
        RS_on_addressUnit_RSide, RD_on_addressUnit_RSide : in std_logic -- register file
        Address_on_dataBus : in std_logic,
        addressBus : out std_logic_vector(15 downto 0) ;
        dataBus : inout std_logic_vector(15 downto 0)
    ) ;
end entity ; -- DataPath

architecture behav of DataPath is
	component AddressUnit is
	PORT (
		clk, ResetPC, PCplusI, PCplus1 : IN std_logic;
        Rside : IN std_logic_vector (15 DOWNTO 0);
        Iside : IN std_logic_vector (7 DOWNTO 0);
        Address : OUT std_logic_vector (15 DOWNTO 0);
		RplusI, Rplus0, EnablePC : IN std_logic
    );
    end component;

    component InstructionRegister is 
    PORT (
		clk : IN std_logic;
        IRLoad : IN std_logic;
        input: IN std_logic_vector (15 DOWNTO 0);
		output: OUT std_logic_vector (15 DOWNTO 0)
    );
    end component;

    component WindowPointer is 
	PORT (
		clk : IN std_logic;
        WPLoad, WPReset, WPAdd : IN std_logic;
        input: IN std_logic_vector (5 DOWNTO 0);
		output: OUT std_logic_vector (5 DOWNTO 0)
    );
    end component;

    component RegisterFile is
	port (
		clk, RFSWrite, RFDWrite : in std_logic ;
		WPAddress : in std_logic_vector(5 downto 0) ;
		Shadow : in std_logic_vector(3 downto 0) ;
		data_in : in std_logic_vector(15 downto 0) ;
		RSOutPut : out std_logic_vector(15 downto 0) ;
		RDOutPut : out std_logic_vector(15 downto 0)
	) ;
	end component;

    component ALU is
        port (
            clk : in std_logic;
            zeroIN, carryIN : in std_logic;
            zeroOut, carryOut : out std_logic;
            ALUOut : out std_logic_vector(15 downto 0) ;
            A, B : in std_logic_vector(15 downto 0) ;
            opcode : in std_logic_vector(3 downto 0)
        ) ;
    end component ;

	component Flags is
	port (
		clk : in std_logic;
		Zin, Cin : in std_logic;
		CSet, CReset, ZSet, ZReset, SRload : in std_logic;
		Cout, Zout : out std_logic
	) ;
	end component ;


begin


end architecture ; -- behav