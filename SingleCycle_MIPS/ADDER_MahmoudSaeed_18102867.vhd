----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:38:18 06/03/2021 
-- Design Name: 
-- Module Name:    ADDER_MahmoudSaeed_18102867 - Behavioral 
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

entity ADDER_MahmoudSaeed_18102867 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Y : out  STD_LOGIC_VECTOR (31 downto 0));
end ADDER_MahmoudSaeed_18102867;

architecture Behavioral of ADDER_MahmoudSaeed_18102867 is

begin

Y <= STD_LOGIC_VECTOR(to_unsigned((to_integer(unsigned(A))+to_integer(unsigned(B))), 32));


end Behavioral;

