--------------------------------------------------------------------------------
-- Author:        Mohammad Mahdi Rahimi (mohammadmahdi76@gmail.com)
--
-- Create Date:   20-04-2017
-- Module Name:   RegisterFile.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity RegisterFile is
  port (
	clk, RFSWrite, RFDWrite : in std_logic ;
	WPAddress : in std_logic_vector(5 downto 0) ;
	Shadow : in std_logic_vector(3 downto 0) ;
	data_in : in std_logic_vector(15 downto 0) ;
	RSOutPut : out std_logic_vector(15 downto 0) ;
	RDOutPut : out std_logic_vector(15 downto 0)
  ) ;
end entity ; -- RegisterFile

architecture behav of RegisterFile is
	type data is array(63 downto 0) of std_logic_vector(15 downto 0);
	signal registers : data;
	
begin
	
	process( clk )
	VARIABLE srcReg : integer range 0 to 64;
	VARIABLE dstReg : integer range 0 to 64;
	begin
		srcReg := to_integer(unsigned(WPAddress) + unsigned(Shadow(1 downto 0)));
		dstReg := to_integer(unsigned(WPAddress) + unsigned(Shadow(3 downto 2)));
		if (clk'event and clk = '1') then
			if (RFSWrite = '1' or RFDWrite = '1') then
				if (RFSWrite = '1') then
					registers(srcReg) <= data_in; 
				end if;
				if (RFDWrite = '1') then
					registers(dstReg) <= data_in;
				end if;
			else
				RSOutPut <= registers(srcReg);
				RDOutPut <= registers(dstReg);
			end if;
		end if;
	end process ;
end architecture ; -- behav