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
	clk : in std_logic;
	RS, RD : in std_logic_vector(15 downto 0) ;
	zero : out std_logic;
	carry : out std_logic
  ) ;
end entity ; -- Comparision

architecture arch of Comparision is
begin
	process( clk )
	begin
		if clk'event and clk = '1' then
			if (unsigned(RD) = unsigned(RS)) then
				zero  <= '1';
				carry <= '0';
			elsif (unsigned(RD) < unsigned(RS)) then
				zero  <= '0';
				carry <= '1';
			end if;
		end if;
	end process ;
end architecture ; -- arch