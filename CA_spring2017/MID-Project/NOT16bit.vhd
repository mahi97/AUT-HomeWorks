--------------------------------------------------------------------------------
-- Author:        Mohammad Mahdi Rahimi (mohammadmahdi76@gmail.com)
--
-- Create Date:   21-04-2017
-- Module Name:   NOT16bit.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity NOT16bit is
  port (
	data1 : in std_logic_vector(15 downto 0) ;
	data2 : out std_logic_vector(15 downto 0)
  ) ;
end entity ; -- NOT16bit

architecture arch of NOT16bit is
begin
	l2 : for i in 0 to 15 generate
		data2(i) <= not data1(i);
	end generate ; -- l2
end architecture ; -- arch