--------------------------------------------------------------------------------
-- Author:        Mohammad Mahdi Rahimi (mohammadmahdi76@gmail.com)
--
-- Create Date:   20-04-2017
-- Module Name:   Controller.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity Controller is
	port (
		clk, ext_reset : in std_logic;
		memDataReady : in std_logic;
		Zout, Cout : in std_logic; -- Flags
		IRout : in std_logic_vector(15 downto 0) ; -- instruction
		IRLoad : out std_logic; -- instruction register
		CSet, CReset, ZSet, ZReset, SRload : out std_logic; -- Flags
		WPAdd, WPReset, WPLoad : out std_logic; -- Window Pointer
		ResetPC, PCplus1, PCplusI, Rplus0, RplusI, EnablePC : out std_logic; -- Address Unit
		opcode : out std_logic_vector(3 downto 0) ; -- ALU
		shadow : out std_logic; -- shadow instruction
		RFSWrite, RFDWrite : out std_logic; -- register file
		readMem, writeMem, readIO, writeIO : out std_logic; -- memory and IO
		ALUOut_on_dataBus : out std_logic; -- ALU
		RS_on_addressUnit_RSide, RD_on_addressUnit_RSide : out std_logic; -- register file
		data : out std_logic_vector(7 downto 0) ;
		Address_on_dataBus : out std_logic
	) ;
end entity ; -- Controller

architecture RTL of Controller is
	type state is (S0, S1, S2, S3, S35, S4, SW, S5, SH);
	signal current_state : state;
	signal next_state : state;
begin
	-- next to current
	process (clk, ext_reset)
	begin
		if ext_reset = '1' then
			current_state <= S0;
		elsif clk'event and clk = '1' then
			current_state <= next_state;
		end if;
	end process;

	-- next based on state
	process (current_state)
	begin
		case current_state is
			when S0 => 
				readMem <= '1';
				writeMem <= '0';
				ResetPC <= '1';
				IRLoad <= '0';
				CReset <= '1';
				ZReset <= '1';
				CSet <= '0';
				ZSet <= '0';
				SRload <= '0';
				WPReset <= '1';
				WPAdd <= '0';
				WPLoad <= '0';
				EnablePC <= '1';
				PCplus1 <= '0';
				PCplusI <= '0';
				Rplus0 <= '0';
				RplusI <= '0';
				shadow <= '0';
				Address_on_dataBus <= '0';
				ALUOut_on_dataBus <= '0';
				RS_on_addressUnit_RSide <= '0';
				RD_on_addressUnit_RSide <= '0';
				RFSWrite <= '0';
				RFDWrite <= '0';

				next_state <= S1;
			when S1 => 
				readMem <= '0';
				IRLoad <= '1';
				ResetPC <= '0';
				IRLoad <= '0';
				CReset <= '0';
				ZReset <= '0';
				WPReset <= '0';
				PCplus1 <= '0';

				next_state <= S2;
			when S2 => 
				IRLoad <= '0';
				data <= IRout(15 downto 8);
				if IRout(15 downto 12) = "1111" 
				or (IRout(15 downto 12) = "0000" and IRout(11 downto 10) = "10")
				or (IRout(15 downto 8 ) = "00000111") then
					shadow <= '1';
				end if;
				next_state <= S3;
			when S3 => 
				if IRout(15 downto 12) = "0000" then
					next_state <= SW;
					case( IRout(11 downto 8) ) is
						when "0000" => -- NO OPERATION
						when "0001" =>
							next_state <= SH;
						when "0010" =>
							ZSet <= '1';
						when "0011" =>
							ZReset <= '1';
						when "0100" =>
							CSet <= '1';
						when "0101" =>
							CReset <= '1';
						when "0110" =>
							WPReset <= '1';
						when "0111" =>
							EnablePC <= '1';
							PCplusI <= '1';
						when "1000" =>
							if Zout = '1' then
								EnablePC <= '1';
								PCplusI <= '1';
							end if;
						when "1001" =>
							if Cout = '1' then
								EnablePC <= '1';
								PCplusI <= '1';
							end if;
						when "1010" =>
							WPAdd <= '1';
						when others =>
					end case ;
				elsif IRout(15 downto 12) = "1111" then
					case( IRout(9 downto 8) ) is
					
						when "00" =>
							next_state <= S5;
							--ALUOut_on_dataBus <= '1';
							--RFDWrite <= '1';
						when "01" =>
							next_state <= S5;
							--ALUOut_on_dataBus <= '1';
							--RFDWrite <= '1';
						when "10" =>
							next_state <= SW;
							Address_on_dataBus <= '1';
							PCplusI <= '1';
							RFDWrite <= '1';
						when "11" =>
							next_state <= SW;
							RD_on_addressUnit_RSide <= '1';
							RplusI <= '1';
							EnablePC <= '1';
						when others =>
							next_state <= SW;			
					end case ;
				else
					next_state <= S35;
					case( IRout(15 downto 12) ) is
						when "0001" => -- MOVE
							ALUOut_on_dataBus <= '1';
							RFDWrite <= '1';
						when "0010" => -- LOAD
							RS_on_addressUnit_RSide <= '1';
							RFDWrite <= '1';
							readMem <= '1';
							Rplus0 <= '1';
						when "0011" => -- STORE
							ALUOut_on_dataBus <= '1';
							RD_on_addressUnit_RSide <= '1';
							writeMem <= '1';
							Rplus0 <= '1';
						when "0100" => -- IN PORT

						when "0101" => -- OUT PORT
						when "0110" => -- AND
							ALUOut_on_dataBus <= '1';
							RFDWrite <= '1';
						when "0111" =>
							ALUOut_on_dataBus <= '1';
							RFDWrite <= '1';
						when "1000" =>
							ALUOut_on_dataBus <= '1';
							RFDWrite <= '1';
						when "1001" =>
							ALUOut_on_dataBus <= '1';
							RFDWrite <= '1';
						when "1010" =>
							ALUOut_on_dataBus <= '1';
							RFDWrite <= '1';
						when "1011" =>
							ALUOut_on_dataBus <= '1';
							RFDWrite <= '1';
						when "1100" =>
							ALUOut_on_dataBus <= '1';
							RFDWrite <= '1';
						when "1101" =>
							ALUOut_on_dataBus <= '1';
							RFDWrite <= '1';
						when "1110" => -- CMP 
						when others =>			
					end case ;
				end if;
				shadow <= '0';
				data <= IRout(7 downto 0);
			when S35 =>
				next_state <= S4;
				writeMem <= '0';
				IRLoad <= '0';
				CSet <= '0';
				ZSet <= '0';
				SRload <= '0';
				WPAdd <= '0';
				WPLoad <= '0';
				EnablePC <= '1';
				PCplus1 <= '0';
				PCplusI <= '0';
				Rplus0 <= '0';
				RplusI <= '0';
				Address_on_dataBus <= '0';
				ALUOut_on_dataBus <= '0';
				RS_on_addressUnit_RSide <= '0';
				RD_on_addressUnit_RSide <= '0';
				RFSWrite <= '0';
				RFDWrite <= '0';
				readMem <= '0';
				ResetPC <= '0';
				IRLoad <= '0';
				CReset <= '0';
				ZReset <= '0';
				WPReset <= '0';
			when S4 => 
				next_state <= SW;
				case( IRout(7 downto 4) ) is
					when "0001" => -- MOVE
						ALUOut_on_dataBus <= '1';
						RFDWrite <= '1';
					when "0010" => -- LOAD
						RS_on_addressUnit_RSide <= '1';
						RFDWrite <= '1';
						readMem <= '1';
						Rplus0 <= '1';
					when "0011" => -- STORE
						ALUOut_on_dataBus <= '1';
						RD_on_addressUnit_RSide <= '1';
						writeMem <= '1';
						Rplus0 <= '1';
					when "0100" => -- IN PORT

					when "0101" => -- OUT PORT
					when "0110" => -- AND
						ALUOut_on_dataBus <= '1';
						RFDWrite <= '1';
					when "0111" =>
						ALUOut_on_dataBus <= '1';
						RFDWrite <= '1';
					when "1000" =>
						ALUOut_on_dataBus <= '1';
						RFDWrite <= '1';
					when "1001" =>
						ALUOut_on_dataBus <= '1';
						RFDWrite <= '1';
					when "1010" =>
						ALUOut_on_dataBus <= '1';
						RFDWrite <= '1';
					when "1011" =>
						ALUOut_on_dataBus <= '1';
						RFDWrite <= '1';
					when "1100" =>
						ALUOut_on_dataBus <= '1';
						RFDWrite <= '1';
					when "1101" =>
						ALUOut_on_dataBus <= '1';
						RFDWrite <= '1';
					when "1110" => -- CMP 
					when others =>			
				end case ;
			when S5 =>
				next_state <= SW;
				if IRout(15 downto 12) = "1111" then
					case( IRout(9 downto 8) ) is	
						when "00" =>
							ALUOut_on_dataBus <= '1';
							RFDWrite <= '1';
						when "01" =>
							ALUOut_on_dataBus <= '1';
							RFDWrite <= '1';
						when others =>
					end case ;
				end if;
			when SW =>
				next_state <= S1;
				
				PCplus1 <= '1';
				readMem <= '1';
				
				writeMem <= '0';
				ResetPC <= '0';
				IRLoad <= '0';
				CReset <= '0';
				ZReset <= '0';
				CSet <= '0';
				ZSet <= '0';
				SRload <= '0';
				WPReset <= '0';
				WPAdd <= '0';
				WPLoad <= '0';
				EnablePC <= '1';
				PCplus1 <= '0';
				PCplusI <= '0';
				Rplus0 <= '0';
				RplusI <= '0';
				shadow <= '0';
				Address_on_dataBus <= '0';
				ALUOut_on_dataBus <= '0';
				RS_on_addressUnit_RSide <= '0';
				RD_on_addressUnit_RSide <= '0';
				RFSWrite <= '0';
				RFDWrite <= '0';

			when SH =>
				next_state <= SH;
		end case;
	end process;
end architecture ; -- RTL