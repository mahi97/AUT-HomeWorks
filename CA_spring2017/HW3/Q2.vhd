library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity Memory is
  port (
	clk, reset, s_read, s_write : in  std_logic;
	idata                       : in  std_logic_vector(7 downto 0);
	odata                       : out std_logic_vector(7 downto 0);
	p_select                    : in  std_logic_vector(3 downto 0)
  ) ;

end entity ; -- Memory

architecture RTL of Memory is

type ram is array(15 downto 0) of std_logic_vector(7 downto 0);	
signal ram1_1 : ram;	

begin
process_0 : process( clk )
begin

	if clk = '1' and clk'event then
		if s_write = '1' then
			ram1_1(to_integer(unsigned(p_select))) <= (idata);
		elsif s_read = '1' then
			odata <= ram1_1(to_integer(unsigned(p_select)));
		else
			odata <= "00000000";
		end if;
	end if;

end process ; -- process_0
end architecture ; -- RTL
