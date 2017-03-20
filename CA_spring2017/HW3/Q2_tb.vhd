library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity Memory_tb is
end entity ; -- Memory_tb

architecture behav of Memory_tb is
	component Memory 
	  port (
		clk, reset, s_read, s_write : in  std_logic;
		idata                       : in  std_logic_vector(7 downto 0);
		odata                       : out std_logic_vector(7 downto 0);
		p_select                    : in  std_logic_vector(3 downto 0)
	  ) ;
  	end component;

  	signal clk, reset, s_read, s_write : std_logic := '0';
  	signal idata : std_logic_vector(7 downto 0) := "00000000";
  	signal odata : std_logic_vector(7 downto 0) := "00000000";
  	signal p_select : std_logic_vector(3 downto 0) := "0000" ;
  	signal finished : std_logic := '0';
begin
		Memory_0 : Memory port map (
			clk   => clk,
			reset => reset,
			s_read => s_read,
   			s_write => s_write,
   			idata => idata,
   			odata => odata,
   			p_select => p_select
   		);

		clk <= 	not clk after 100 ns when finished /= '1' else '0';

		s_write <= 	'1', '0' after 3200 ns;
		s_read <= '1' after 3200 ns;		
		idata <= std_logic_vector( unsigned(idata) + 1 ) after 200 ns when idata /= "11111111" and s_read /= '1' else "00000000";
		p_select <= std_logic_vector( unsigned(p_select) + 1 ) after 200 ns when p_select /= "1111" and finished /= '1' else "0000";
		finished <= '1' after 6400 ns;


end architecture ; -- behav