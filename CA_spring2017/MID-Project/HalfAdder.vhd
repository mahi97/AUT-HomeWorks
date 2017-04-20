--------------------------------------------------------------------------------
-- Author:        Mohammad Mahdi Rahimi (mohammadmahdi76@gmail.com)
--
-- Create Date:   20-04-2017
-- Module Name:   HalfAdder.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity HalfAdder is
	port(in1  : in  std_logic;
    	in2   : in  std_logic;
    	sum   : out std_logic;
    	carry : out std_logic);
end entity;

architecture arch  of HalfAdder is 
  begin  
    sum   <= in1 xor in2;
    carry <= in1 and in2;  
end arch;
