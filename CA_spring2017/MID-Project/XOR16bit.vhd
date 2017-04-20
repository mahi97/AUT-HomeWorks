--------------------------------------------------------------------------------
-- Author:        Mohammad Mahdi Rahimi (mohammadmahdi76@gmail.com)
--
-- Create Date:   20-04-2017
-- Module Name:   XOR16bit.vhd
--------------------------------------------------------------------------------
Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity XOR16bit is
    port(clk : in std_logic;
        data1, data2 : in std_logic_vector(15 downto 0);
        data_out :out std_logic_vector(15 downto 0));
end entity;
  
architecture arch of XOR16bit is
begin
    process(clk) begin
        if(clk='1' and clk'event) then
            L1: for i in 0 to 15 loop
                data_out(i) <= data1(i) xor data2(i);
            end loop L1;
        end if;
    end process;
end architecture; -- arch


