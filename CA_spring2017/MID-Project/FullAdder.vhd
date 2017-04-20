--------------------------------------------------------------------------------
-- Author:        Mohammad Mahdi Rahimi (mohammadmahdi76@gmail.com)
--
-- Create Date:   20-04-2017
-- Module Name:   FullAdder.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity FullAdder is
    port(i1  : in  std_logic;
        i2   : in  std_logic;
        c    : in  std_logic;
        s    : out std_logic;
        cout : out std_logic);
end entity ;

architecture arch  of FullAdder is 
    component HalfAdder is 
        port(in1  : in  std_logic;
            in2   : in  std_logic;
            sum   : out std_logic;
            carry : out std_logic);
    end component;

    signal internal1 , internal2 , internal3: std_logic;
begin

    half_adder_0 : HalfAdder port map(i1, i2, internal1, internal2);
    half_adder_1 : HalfAdder port map(internal1, c, s, internal3);
    cout <= internal2 or internal3;

end arch;
