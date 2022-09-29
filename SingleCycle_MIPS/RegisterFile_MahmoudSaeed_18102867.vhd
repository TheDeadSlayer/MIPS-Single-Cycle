----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:24:46 06/03/2021 
-- Design Name: 
-- Module Name:    RegisterFile_MahmoudSaeed_18102867 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterFile_MahmoudSaeed_18102867 is
    Port ( RegWrite : in  STD_LOGIC;
           ReadReg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           ReadReg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteReg : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
           ReadData1 : out  STD_LOGIC_VECTOR (31 downto 0);
           ReadData2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile_MahmoudSaeed_18102867;

architecture Behavioral of RegisterFile_MahmoudSaeed_18102867 is


type RegisterFile1 is array(0 to 31) of STD_LOGIC_VECTOR ( 31 downto 0);
signal registers : RegisterFile1:= (4=>x"00000000",5=>x"0000003C", Others=>x"00000000");
	
	

begin


process (CLK,RegWrite)
	begin
		ReadData1<= registers (to_integer(unsigned(ReadReg1)));
		ReadData2<= registers (to_integer(unsigned(ReadReg2)));
		
		if rising_edge(CLK) and RegWrite='1' then
			registers(to_integer(unsigned(WriteReg)))<=WriteData;
		end if;
	end process;
	

end Behavioral;

