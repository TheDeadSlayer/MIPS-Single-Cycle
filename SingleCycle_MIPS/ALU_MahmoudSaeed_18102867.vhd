----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:44:59 06/03/2021 
-- Design Name: 
-- Module Name:    ALU_MahmoudSaeed_18102867 - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_MahmoudSaeed_18102867 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           S : in  STD_LOGIC_VECTOR (3 downto 0);
           Result : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC);
end ALU_MahmoudSaeed_18102867;

architecture Behavioral of ALU_MahmoudSaeed_18102867 is

signal t:std_logic_vector(31 downto 0);
signal zflag:std_Logic;


begin
process(A,B,S,t)

begin

case (S) is

when "0000"=>                           --AND
t<= A and B;

when "0001"=>                           --OR
t<= A or B;

when "0010"=>                           --ADD
t<= A+B;

when "0110"=>                           --SUBTRACT
t<= A-B;

when "0111"=>                           --SET LESS THAN (A<B)
If(A<B)then
t<= (0=>'1',others=>'0');
else
t<=(others=>'0');
end if; 

when "1100"=>                           --NOR
t<= A nor B;

when others => t<= (others=>'0');
end case;

if(A=B) then 
zflag<= '1';
else
zflag<='0';
end if;

end process;

Result<=t;
Zero<=zflag;

end Behavioral;

