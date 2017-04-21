--------------------------------------------------------------------------------
-- Author:        Mohammad Mahdi Rahimi (mohammadmahdi76@gmail.com)
--
-- Create Date:   20-04-2017
-- Module Name:   ALU.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU is
	port (
		clk : in std_logic;
		zeroIN, carryIN : in std_logic;
		zeroOut, carryOut : out std_logic;
		ALUOut : out std_logic_vector(15 downto 0) ;
		A, B : in std_logic_vector(15 downto 0) ;
		shadow : in std_logic;
		shadow_data : in std_logic_vector(7 downto 0) ;
		opcode : in std_logic_vector(3 downto 0)
	) ;
end entity ; -- ALU

architecture behav of ALU is

	component AND16bit is
		port(
		data1, data2 : in std_logic_vector(15 downto 0);
		data_out : out std_logic_vector(15 downto 0)
		);
	end component;

	component OR16bit is
		port(
			data1, data2 : in std_logic_vector(15 downto 0);
			data_out :out std_logic_vector(15 downto 0)
		);
	end component;

	component XOR16bit is
		port(
			data1, data2 : in std_logic_vector(15 downto 0);
			data_out : out std_logic_vector(15 downto 0)
		);
	end component;

	component AdderSubtractor is
		port(
			OP   : in  std_logic;
			Cin  : in  std_logic;
			A, B : in  std_logic_vector(15 downto 0);
			Res  : out std_logic_vector(15 downto 0);
			Cout : out std_logic
		);
	end component;

	component Comparision is
		port (
			RS, RD : in std_logic_vector(15 downto 0) ;
			zero : out std_logic;
			carry : out std_logic
		) ;
	end component ;

	component NOT16bit is
	port (
		data1 : in std_logic_vector(15 downto 0) ;
		data2 : out std_logic_vector(15 downto 0)
  	) ;
	end component ; -- NOT16bit

signal last : std_logic := '0';
signal lastCommand : std_logic_vector(7 downto 0) ;
signal ANDOUT : std_logic_vector(15 downto 0) ;
signal OROUT : std_logic_vector(15 downto 0) ;
signal NOTOUT : std_logic_vector(15 downto 0) ;
signal ADDOUT : std_logic_vector(15 downto 0) ;
signal OP : std_logic;
signal CMPOUT : std_logic_vector(15 downto 0) ;
begin
	
	aand : AND16bit port map (A, B, ANDOUT);
	aor  : OR16bit  port map (A, B, OROUT);
	anot : NOT16bit port map (A, NOTOUT);
	aadd : AdderSubtractor port map (OP, carryIN, A, B, ADDOUT, carryOut);
	acmp : Comparision port map (A, B, zeroOut, carryOut);
	ALU_Procces : process( clk )
	begin
		if clk'event and clk = '1' then 
			if shadow = '1' then
				last <= '1';
				lastCommand <= shadow_data;
			elsif last = '1' then  -- immidiate
				if lastCommand(7 downto 4) = "1111" then
				case( lastCommand(1 downto 0 ) ) is
				
					when "00" => -- MIL
						ALUOut <= "ZZZZZZZZ" & shadow_data;
					when "01" => -- MIH
						ALUOut <= shadow_data & "ZZZZZZZZ";
					when "10" => -- SPC -- controller

					when "11" => -- JPA -- controller

					when others =>
				
				end case ;
				end if;
			else -- normal
				case( shadow_data(7 downto 4) ) is
				
					when "0001" => -- MOVE
						ALUOut <= A;
					when "0010" => -- LOAD

					when "0011" => -- STORE
						ALUOut <= A;
					when "0100" => -- IN PORT

					when "0101" => -- OUT PORT

					when "0110" =>
						ALUOut <= ANDOUT;
					when "0111" =>
						ALUOut <= OROUT;
					when "1000" =>
						ALUOut <= NOTOUT;
					when "1011" =>
						OP <= '0';
						ALUOut <= ADDOUT;
					when "1100" =>
						OP <= '1';
						ALUOut <= ADDOUT;
					when "1110" =>
						ALUOut <= CMPOUT;
					when "1001" => -- SHIFT LEFT
					when "1010" => -- SHIFT RIGHT
					when "1101" => -- MULITIPLY
					when others =>
				end case ;
			end if;
		end if;
	end process ; -- ALU_Procces


end architecture ; -- behav