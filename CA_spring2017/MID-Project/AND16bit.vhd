--------------------------------------------------------------------------------
-- Author:        Mohammad Mahdi Rahimi (mohammadmahdi76@gmail.com)
--
-- Create Date:   20-04-2017
-- Module Name:   AND16bit.vhd
--------------------------------------------------------------------------------
Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AND16bit is
    port(data1, data2 : in std_logic_vector(15 downto 0);
        data_out : out std_logic_vector(15 downto 0)
    );
end entity;
  
architecture arch of AND16bit is
begin  
    L1: for i in 0 to 15 generate
        data_out(i) <= data1(i) and data2(i);
    end generate L1;
end architecture; -- arch