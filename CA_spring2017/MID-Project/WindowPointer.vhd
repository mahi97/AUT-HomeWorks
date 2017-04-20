--------------------------------------------------------------------------------
-- Author:        Mohammad Mahdi Rahimi (mohammadmahdi76@gmail.com)
--
-- Create Date:   20-04-2017
-- Module Name:   WindowPointer.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity WindowPointer is
	PORT (
		WPLoad, WPReset, WPAdd : IN std_logic;
		input: IN std_logic_vector (5 DOWNTO 0);
		clk : IN std_logic;
		output: OUT std_logic_vector (5 DOWNTO 0)
    );
end entity ; -- WindowPointer

architecture arch of WindowPointer is
begin
process( clk, WPReset, WPAdd )
begin
	if (clk'event and clk = '1') then
		if (WPReset = '1') then
			output <= (OTHERS => '0');
		elsif (WPLoad = '1') then
			output <= input;
		elsif (WPAdd = '1') then -- TODO : FIX THIS
			output <= input;
		end if;
	end if;
			
end process ; 

end architecture ; -- arch