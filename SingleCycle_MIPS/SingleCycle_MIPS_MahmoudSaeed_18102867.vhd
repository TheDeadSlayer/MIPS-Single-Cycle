----------------------------------------------------------------------------------
-- Engineer: Mahmoud Saeed Osman Mohammed
-- Registration Number: 18102867
-- Computer Engineering Department

-- Create Date:    20:11:43 06/03/2021 
-- Design Name: 
-- Module Name:   SingleCycle_MIPS_MahmoudSaeed_18102867 - Behavioral 
-- Project Name: 	Single Cycle MIPS Prcocessor
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

entity SingleCycle_MIPS_MahmoudSaeed_18102867 is
    Port ( CLK : in  STD_LOGIC:='0');
end SingleCycle_MIPS_MahmoudSaeed_18102867;

architecture Behavioral of SingleCycle_MIPS_MahmoudSaeed_18102867 is

component PC_MahmoudSaeed_18102867 is
    Port ( PCin : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
           PCout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component InstructionMem_MahmoudSaeed_18102867 is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           MemRead : out  STD_LOGIC_VECTOR (31 downto 0)
           );
end component;

component MUX2to1_5Bits_MahmoudSaeed_18102867 is
    Port ( A : in  STD_LOGIC_VECTOR (4 downto 0);
           B : in  STD_LOGIC_VECTOR (4 downto 0);
           S : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (4 downto 0));
end component;

component MUX2to1_MahmoudSaeed_18102867 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           S : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component ADDER_MahmoudSaeed_18102867 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Y : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component ShiftLeft2_MahmoudSaeed_18102867 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component ControlUnit_MahmoudSaeed_18102867 is
    Port ( OPCode : in  STD_LOGIC_VECTOR (5 downto 0);
           REGDst : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           MemtoReg : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           ALUOP : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

component SignExtend_MahmoudSaeed_18102867 is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component ALUControl_MahmoudSaeed_18102867 is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
           Funct : in  STD_LOGIC_VECTOR (5 downto 0);
           Output : out  STD_LOGIC_VECTOR (3 downto 0));
end component;


component ALU_MahmoudSaeed_18102867 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           S : in  STD_LOGIC_VECTOR (3 downto 0);
           Result : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC);
end component;

component RegisterFile_MahmoudSaeed_18102867 is
    Port ( RegWrite : in  STD_LOGIC;
           ReadReg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           ReadReg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteReg : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
           ReadData1 : out  STD_LOGIC_VECTOR (31 downto 0);
           ReadData2 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MemoryUnit_MahmoudSaeed_18102867 is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           MemRead : in  STD_LOGIC;
           MemWrite : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           ReadData : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

-- PC
signal PCin : STD_LOGIC_VECTOR (31 downto 0);
signal PCout : STD_LOGIC_VECTOR (31 downto 0);
signal PCAdd4 : STD_LOGIC_VECTOR (31 downto 0);
signal AdderB: STD_LOGIC_VECTOR (31 downto 0);

-- Control
signal ALUSrc : STD_LOGIC;
signal RegWrite : STD_LOGIC;
signal RegDest : STD_LOGIC;
signal Branch : STD_LOGIC;
signal MemRead : STD_LOGIC;
signal MemtoReg : STD_LOGIC;
signal ALUOp : STD_LOGIC_VECTOR (1 downto 0);
signal MemWrite : STD_LOGIC;


--Instructions
signal Instructions : STD_LOGIC_VECTOR (31 downto 0);
signal OP : STD_LOGIC_VECTOR (5 downto 0);
signal Rs : STD_LOGIC_VECTOR (4 downto 0);
signal Rt : STD_LOGIC_VECTOR (4 downto 0);
signal Rd : STD_LOGIC_VECTOR (4 downto 0);
signal Imm : STD_LOGIC_VECTOR (15 downto 0);
signal Funct : STD_LOGIC_VECTOR (5 downto 0);

-- Registers
signal ALUSrcData : STD_LOGIC_VECTOR (31 downto 0);
signal ImmExtend: STD_LOGIC_VECTOR (31 downto 0);
signal ImmShift: STD_LOGIC_VECTOR (31 downto 0);
signal WriteReg : STD_LOGIC_VECTOR (4 downto 0);
signal WriteData : STD_LOGIC_VECTOR (31 downto 0);
signal ReadData1 : STD_LOGIC_VECTOR (31 downto 0);
signal ReadData2 : STD_LOGIC_VECTOR (31 downto 0);


--ALU
signal MemData : STD_LOGIC_VECTOR (31 downto 0);
signal ALUZero : STD_LOGIC;
signal ALUS : STD_LOGIC_VECTOR (3 downto 0);
signal ALURes : STD_LOGIC_VECTOR (31 downto 0);

signal temp :STD_LOGIC;

begin

temp<=ALUZero and Branch;

--PC
PC: PC_MahmoudSaeed_18102867 port map(PCin,CLK,PCout);

--Instructions Memory
InstructionMemory: InstructionMem_MahmoudSaeed_18102867 port map(PCout,Instructions);
OP <= Instructions(31 downto 26);
Rs <= Instructions(25 downto 21);
Rt <= Instructions(20 downto 16);
Rd <= Instructions(15 downto 11);
Imm <= Instructions(15 downto 0);
Funct <= Instructions(5 downto 0);

--MUX
RegDestMux: MUX2to1_5Bits_MahmoudSaeed_18102867 port map (Rt,Rd,RegDest,WriteReg);
BranchMux: MUX2to1_MahmoudSaeed_18102867 port map (PCAdd4, AdderB,temp,PCin);
ALUSrcMux: MUX2to1_MahmoudSaeed_18102867 port map (ReadData2,ImmExtend,ALUSrc,ALUSrcData);
MemtoRegMux: MUX2to1_MahmoudSaeed_18102867 port map(ALURes,MemData,MemtoReg,WriteData);

--Adder
BAdder: ADDER_MahmoudSaeed_18102867 port map (PCAdd4, ImmShift, AdderB);
PCAdder: ADDER_MahmoudSaeed_18102867 port map (PCout, STD_LOGIC_VECTOR(to_unsigned(4, 32)), PCAdd4);

--Shift left 2
ShiftLeft2: ShiftLeft2_MahmoudSaeed_18102867 port map (ImmExtend,ImmShift);

--Control
ControlUnit:ControlUnit_MahmoudSaeed_18102867 port map (OP, RegDest, ALUSrc,MemtoReg ,RegWrite, MemWrite ,MemRead ,Branch ,ALUOp); 

--Sign Extend 16 -> 32
SignExtend: SignExtend_MahmoudSaeed_18102867 port map (Imm, ImmExtend);


--ALU
ALU: ALU_MahmoudSaeed_18102867 port map (ReadData1, ALUSrcData, ALUS, ALURes, ALUZero);  
ALUControl: ALUControl_MahmoudSaeed_18102867 port map (ALUOp, Funct, ALUS);


--Register
RegisterFile: RegisterFile_MahmoudSaeed_18102867 port map (RegWrite, Rs, Rt, WriteReg,WriteData , CLK, ReadData1, ReadData2);


--Memory
MemoryUnit: MemoryUnit_MahmoudSaeed_18102867 port map (ALURes,MemRead ,MemWrite ,CLK , ReadData2 ,MemData);

end Behavioral;