----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:41:37 06/03/2021 
-- Design Name: 
-- Module Name:    MUX2to1_5Bits_MahmoudSaeed_18102867 - Behavioral 
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

entity MUX2to1_5Bits_MahmoudSaeed_18102867 is
    Port ( A : in  STD_LOGIC_VECTOR (4 downto 0);
           B : in  STD_LOGIC_VECTOR (4 downto 0);
           S : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (4 downto 0));
end MUX2to1_5Bits_MahmoudSaeed_18102867;

architecture Behavioral of MUX2to1_5Bits_MahmoudSaeed_18102867 is

begin

process (A,B,S) begin

if(S='0') then
	Y<=A;
else
	Y<=B;
end if;
end process;

end Behavioral;

