----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:51:36 06/03/2021 
-- Design Name: 
-- Module Name:    ALUControl_MahmoudSaeed_18102867 - Behavioral 
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

entity ALUControl_MahmoudSaeed_18102867 is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
           Funct : in  STD_LOGIC_VECTOR (5 downto 0);
           Output : out  STD_LOGIC_VECTOR (3 downto 0));
end ALUControl_MahmoudSaeed_18102867;

architecture Behavioral of ALUControl_MahmoudSaeed_18102867 is

signal temp : STD_LOGIC_VECTOR (3 downto 0);

begin
temp <= (0 => Funct(0), 1 => Funct(1), 2 => Funct(2), 3 => Funct(3));
process(OP, Funct, temp) begin

case OP is
	when "00" => Output <= "0010";
	when "01" => Output <= "0110";
	when "10" => 
	
		case temp is
			when "0000" => Output <= "0010";
			when "0010" => Output <= "0110";
			when "0100" => Output <= "0000";
			when "0101" => Output <= "0001";
			when "1010" => Output <= "0111";
			when others => Output <= (others => '0');
		end case;
		
	when others => Output <= (others => '0');
	
end case;

end process;


end Behavioral;

