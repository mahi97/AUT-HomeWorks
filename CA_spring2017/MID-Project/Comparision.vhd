--------------------------------------------------------------------------------
-- Author:        Mohammad Mahdi Rahimi (mohammadmahdi76@gmail.com)
--
-- Create Date:   20-04-2017
-- Module Name:   DataPath.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Comparision is
  port (
	RS, RD : in std_logic_vector(15 downto 0) ;
	zero : out std_logic;
	carry : out std_logic
  ) ;
end entity ; -- Comparision

architecture arch of Comparision is
begin
	zero  <= '1' when (to_integer(unsigned(RD)) = to_integer(unsigned(RS))) else '0';
	carry <= '1' when (to_integer(unsigned(RD)) < to_integer(unsigned(RS))) else '0';
end architecture ; -- arch