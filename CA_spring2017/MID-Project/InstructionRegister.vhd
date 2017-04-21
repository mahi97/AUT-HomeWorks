--------------------------------------------------------------------------------
-- Author:        Mohammad Mahdi Rahimi (mohammadmahdi76@gmail.com)
--
-- Create Date:   20-04-2017
-- Module Name:   InstructionRegister.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity InstructionRegister is
    PORT (
		clk : IN std_logic;
		IRLoad : IN std_logic;
		input: IN std_logic_vector (15 DOWNTO 0);
		output: OUT std_logic_vector (15 DOWNTO 0)
    );
end entity ; -- InstructionRegister

architecture dataflow of InstructionRegister is
begin

	process( clk ) 
	begin
		if(clk='1' and clk'event) then
			if (IRLoad = '1') then
				output <= input;
			end if;
		end if;	
	end process ; 

end architecture ; -- dataflow