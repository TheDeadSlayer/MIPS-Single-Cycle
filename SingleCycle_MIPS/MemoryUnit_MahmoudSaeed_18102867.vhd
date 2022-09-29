----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:37:03 06/03/2021 
-- Design Name: 
-- Module Name:    MemoryUnit_MahmoudSaeed_18102867 - Behavioral 
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

entity MemoryUnit_MahmoudSaeed_18102867 is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           MemRead : in  STD_LOGIC;
           MemWrite : in  STD_LOGIC;
           CLK : in  STD_LOGIC :='0';
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           ReadData : out  STD_LOGIC_VECTOR (31 downto 0));
end MemoryUnit_MahmoudSaeed_18102867;

architecture Behavioral of MemoryUnit_MahmoudSaeed_18102867 is

type memoryfile is array (0 to 127) of STD_LOGIC_VECTOR (7 downto 0);
		signal memory : memoryfile:=
		
				(x"43",x"6F",x"6D",x"70",
            x"75",x"74",x"65",x"72",
            x"20",x"41",x"72",x"63",
            x"68",x"69",x"74",x"65",
            x"63",x"74",x"75",x"72",
            x"65",x"20",x"32",x"30",
            x"32",x"31",x"21",x"21",
            x"32",x"31",x"21",x"21",
            x"10",x"00",x"FF",x"F9",
            x"00",x"00",x"00",x"00",
				others => x"00");

begin
	process (MemRead,MemWrite,clk)
	begin
		if falling_edge (CLK) and MemRead ='1' and MemWrite ='0' then
			ReadData <= memory(to_integer(unsigned(Address)))&
							memory(to_integer(unsigned(Address))+1)&
							memory(to_integer(unsigned(Address))+2)&
							memory(to_integer(unsigned(Address))+3);
		end if;
		
		if rising_edge (CLK) and MemRead ='0' and MemWrite ='1' then
			memory(to_integer(unsigned(Address)))<=WriteData (31 downto 24);
			memory(to_integer(unsigned(Address))+1)<=WriteData (23 downto 16);
			memory(to_integer(unsigned(Address))+2)<=WriteData (15 downto 8);
			memory(to_integer(unsigned(Address))+3)<=WriteData (7 downto 0);
		end if;
	end process;


end Behavioral;

