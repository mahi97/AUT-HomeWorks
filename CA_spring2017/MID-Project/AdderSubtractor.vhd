--------------------------------------------------------------------------------
-- Author:        Mohammad Mahdi Rahimi (mohammadmahdi76@gmail.com)
--
-- Create Date:   20-04-2017
-- Module Name:   AdderSubtractor.vhd
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity AdderSubtractor is
    port(
        OP   : in  std_logic;
        A, B : in  std_logic_vector(15 downto 0);
        Res  : out std_logic_vector(15 downto 0);
        Cout, OVERFLOW : out std_logic);
end entity;
 
architecture arch of AdderSubtractor is

    component FullAdder is
        port(i1  : in  std_logic;
            i2   : in  std_logic;
            c    : in  std_logic;
            s    : out std_logic;
            cout : out std_logic
        );
    end component;

    signal TMP , TRes: std_logic_vector(15 downto 0);
    signal C : std_logic_vector(16 downto 0) ;

begin
    C(0) <= OP;
    L0 : for i in 0 to 15 generate
        FAX  : FullAdder port map(A(i), TMP(i), C(i), TRes(i), C(i + 1));    
        TMP(i) <= C(0) xor B(i);
    end generate ;

    Res <= TRes;
    OVERFLOW <= C(15) xor C(16) ;
    Cout <= C(16);

end architecture;
