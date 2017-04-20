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
	clock
  ) ;
end entity ; -- ALU

architecture behav of ALU is

	component AND16bit is
		port(clk : in std_logic;
		data1, data2 : in std_logic_vector(15 downto 0);
		data_out : out std_logic_vector(15 downto 0)
	    );
	end component;

	component OR16bit is
	    port(clk : in std_logic;
	        data1, data2 : in std_logic_vector(15 downto 0);
	        data_out :out std_logic_vector(15 downto 0)
	    );
	end component;

	component AdderSubtractor is
	    port(clk : in  std_logic;
	        OP   : in  std_logic;
	        A, B : in  std_logic_vector(15 downto 0);
	        Res  : out std_logic_vector(15 downto 0);
	        Cout, OVERFLOW : out std_logic
	    );
	end component;

	component Comparision is
		port (
			clk : in std_logic;
			RS, RD : in std_logic_vector(15 downto 0) ;
			zero : out std_logic;
			carry : out std_logic
		) ;
	end component ;


begin



end architecture ; -- behav