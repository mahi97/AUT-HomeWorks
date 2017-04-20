--------------------------------------------------------------------------------
-- Author:        Mohammad Mahdi Rahimi (mohammadmahdi76@gmail.com)
--
-- Create Date:   20-04-2017
-- Module Name:   AdderSubtractor.vhd
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity AdderSubtractor is
    port(clk : in  std_logic;
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

    signal C1, C2, C3, C4 , C5, C6, C7, C8 : std_logic;
    signal TMP , TRes: std_logic_vector(15 downto 0);

begin
    FA0  : FullAdder port map(A(0) , TMP(0) ,OP, TRes(0) ,C1);
    FA1  : FullAdder port map(A(1) , TMP(1) ,C1, TRes(1) ,C2);
    FA2  : FullAdder port map(A(2) , TMP(2) ,C2, TRes(2) ,C3);
    FA3  : FullAdder port map(A(3) , TMP(3) ,C3, TRes(3) ,C4);
    FA4  : FullAdder port map(A(4) , TMP(4) ,C4, TRes(4) ,C5);
    FA5  : FullAdder port map(A(5) , TMP(5) ,C5, TRes(5) ,C6);
    FA6  : FullAdder port map(A(6) , TMP(6) ,C6, TRes(6) ,C7);
    FA7  : FullAdder port map(A(7) , TMP(7) ,C7, TRes(7) ,C8);
    FA8  : FullAdder port map(A(8) , TMP(8) ,OP, TRes(8) ,C1);
    FA9  : FullAdder port map(A(9) , TMP(9) ,C1, TRes(9) ,C2);
    FA10 : FullAdder port map(A(10), TMP(10),C2, TRes(10),C3);
    FA11 : FullAdder port map(A(11), TMP(11),C3, TRes(11),C4);
    FA12 : FullAdder port map(A(12), TMP(12),C4, TRes(12),C5);
    FA13 : FullAdder port map(A(13), TMP(13),C5, TRes(13),C6);
    FA14 : FullAdder port map(A(14), TMP(14),C6, TRes(14),C7);
    FA15 : FullAdder port map(A(15), TMP(15),C7, TRes(15),C8);

    process(clk , op) begin
        L1: for i in 0 to 15 loop
            TMP(i) <= OP xor B(i);
        end loop L1;

        if(clk='1' and clk'event) then
            Res <= TRes;
            OVERFLOW <= C7 xor C8 ;
            Cout <= C8;
      end if;
    end process;
end architecture;
