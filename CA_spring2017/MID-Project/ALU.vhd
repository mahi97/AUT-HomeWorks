--------------------------------------------------------------------------------
-- Author:        Mohammad Mahdi Rahimi (mohammadmahdi76@gmail.com)
--
-- Create Date:   20-04-2017
-- Module Name:   ALU.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU is
	port (
		clk : in std_logic;
		zeroIN, carryIN : in std_logic;
		zeroOut, carryOut : out std_logic;
		ALUOut : out std_logic_vector(15 downto 0) ;
		A, B : in std_logic_vector(15 downto 0) ;
		opcode : in std_logic_vector(3 downto 0)
	) ;
end entity ; -- ALU

architecture behav of ALU is

	component AND16bit is
		port(
		data1, data2 : in std_logic_vector(15 downto 0);
		data_out : out std_logic_vector(15 downto 0)
		);
	end component;

	component OR16bit is
		port(
			data1, data2 : in std_logic_vector(15 downto 0);
			data_out :out std_logic_vector(15 downto 0)
		);
	end component;

	component XOR16bit is
		port(
			data1, data2 : in std_logic_vector(15 downto 0);
			data_out : out std_logic_vector(15 downto 0)
		);
	end component;

	component AdderSubtractor is
		port(
			OP   : in  std_logic;
			A, B : in  std_logic_vector(15 downto 0);
			Res  : out std_logic_vector(15 downto 0);
			Cout, OVERFLOW : out std_logic
		);
	end component;

	component Comparision is
		port (
			RS, RD : in std_logic_vector(15 downto 0) ;
			zero : out std_logic;
			carry : out std_logic
		) ;
	end component ;
begin
	ALU_Procces : process( clk )
	begin
		if clk'event and clk = '1' then 

		end if;
	end process ; -- ALU_Procces


end architecture ; -- behav