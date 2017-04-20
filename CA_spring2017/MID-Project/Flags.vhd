--------------------------------------------------------------------------------
-- Author:        Mohammad Mahdi Rahimi (mohammadmahdi76@gmail.com)
--
-- Create Date:   20-04-2017
-- Module Name:   Flags.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity Flags is
	port (
		clk : in std_logic;
		Zin, Cin : in std_logic;
		CSet, CReset, ZSet, ZReset, SRload : in std_logic;
		Cout, Zout : out std_logic
	) ;
end entity ; -- Flags


architecture arch of Flags is
begin

process( clk )
begin
	if (clk'event and clk = '1') then
		if (CSet = '1') then
			Cout <= '1';
		elsif (CReset = '1') then
			Cout <= '0';
		elsif (SRload = '1') then
			Cout <= Cin;
		end if;

		if (ZSet = '1') then
			Zout <= '1';
		elsif (ZReset = '1') then
			Zout <= '0';
		elsif (SRload = '1') then
			Zout <= Zin;
		end if;
	end if;
end process ;

end architecture ; -- arch