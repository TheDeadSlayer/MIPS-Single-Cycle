----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:07:18 06/03/2021 
-- Design Name: 
-- Module Name:    InstructionMem_MahmoudSaeed_18102867 - Behavioral 
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

entity InstructionMem_MahmoudSaeed_18102867 is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           MemRead : out  STD_LOGIC_VECTOR (31 downto 0)
           );
end InstructionMem_MahmoudSaeed_18102867;


	
	
architecture Behavioral of InstructionMem_MahmoudSaeed_18102867 is

Type InstructMem is array (0 to 127) of STD_LOGIC_VECTOR (7 downto 0);
	signal Instructions : InstructMem:=
	
							(x"20",x"02",x"00",x"00",
							x"20",x"08",x"00",x"04",
							x"20",x"86",x"00",x"00",
							x"20",x"A7",x"00",x"00",
							x"20",x"09",x"00",x"01",
							x"8C",x"C3",x"00",x"00",
							x"20",x"42",x"00",x"01",
							x"AC",x"E3",x"00",x"00",
							x"00",x"C8",x"30",x"20",
							x"00",x"E8",x"38",x"20",
							x"00",x"69",x"50",x"2A",
							x"11",x"40",x"FF",x"F9",
							x"00",x"49",x"10",x"22",
							others=>x"00");
begin

	MemRead<=Instructions(to_integer(unsigned(Address)))&
            Instructions(to_integer(unsigned(Address))+1)&
            Instructions(to_integer(unsigned(Address))+2)&
            Instructions(to_integer(unsigned(Address))+3);


end Behavioral;

