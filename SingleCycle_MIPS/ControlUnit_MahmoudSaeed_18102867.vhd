----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:31:07 06/03/2021 
-- Design Name: 
-- Module Name:    ControlUnit_MahmoudSaeed_18102867 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ControlUnit_MahmoudSaeed_18102867 is
    Port ( OPCode : in  STD_LOGIC_VECTOR (5 downto 0);
           REGDst : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           MemtoReg : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           ALUOP : out  STD_LOGIC_VECTOR (1 downto 0));
end ControlUnit_MahmoudSaeed_18102867;

architecture Behavioral of ControlUnit_MahmoudSaeed_18102867 is

begin

the_process : process(OPCode)

begin

case OPCode is

	when "000000" =>
		REGDst <='1';
		ALUSrc <='0';
		MemtoReg <='0';
		RegWrite <='1';
		MemWrite <='0';
		MemRead <='0';
		Branch <='0';
		ALUOP <= "10";
	
	when "100011" =>
		REGDst <='0';
		ALUSrc <='1';
		MemtoReg <='1';
		RegWrite <='1';
		MemWrite <='0';
		MemRead <='1';
		Branch <='0';
		ALUOP <= "00";
		
	when "101011" =>
		ALUSrc <='1';
		RegWrite <='0';
		MemWrite <='1';
		MemRead <='0';
		Branch <='0';
		ALUOP <="00";

	when "000100" =>
		ALUSrc <='0';
		RegWrite <='0';
		MemWrite <='0';
		MemRead <='0';
		Branch <='1';
		ALUOP <="01";
	
	when "001000" => 
		ALUOp <= "00";
		REGDst <= '0';
		ALUSrc <= '1';
		MemtoReg <= '0';
		RegWrite <= '1';
		MemRead <= '0';
		MemWrite <= '0';
		Branch <= '0';
		

	when others => null;

end case;
end process;

end Behavioral;

