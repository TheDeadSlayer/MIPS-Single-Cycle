----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:43:08 06/03/2021 
-- Design Name: 
-- Module Name:    SignExtend_MahmoudSaeed_18102867 - Behavioral 
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

entity SignExtend_MahmoudSaeed_18102867 is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : out  STD_LOGIC_VECTOR (31 downto 0));
end SignExtend_MahmoudSaeed_18102867;

architecture Behavioral of SignExtend_MahmoudSaeed_18102867 is

begin

process(A) begin
	if(A(15) = '1') then
		B <= x"FFFF"&A;
	else 
		B <= x"0000"&A;
	end if;
end process;

end Behavioral;

