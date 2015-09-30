----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2015 04:14:11 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.NUMERIC_BIT.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( ReadDataA : in STD_LOGIC_VECTOR (7 downto 0);    --operand A
           ReadDataB : in STD_LOGIC_VECTOR (7 downto 0);    --operand B
           OP        : in STD_LOGIC_VECTOR (3 downto 0);    --operation control
           Result    : out STD_LOGIC_VECTOR (7 downto 0));  --result
end ALU;

architecture Behavioral of ALU is

component ALU_Slice is
    Port ( A_bit : in STD_LOGIC;   -- first input
           B_bit : in STD_LOGIC;   -- second input
           Lin : in STD_LOGIC;  -- shift input bit [cout(6:0)]
           OP : in STD_LOGIC_VECTOR (3 downto 0);
           Z : out STD_LOGIC;   -- output
          
           Hout : out STD_LOGIC;-- shift output [cout(7:0)]
           Hin : in STD_LOGIC);  -- carry input bit [cout(7:1)]
end component ALU_Slice;

signal Ztemp : STD_LOGIC_VECTOR (7 downto 0);
signal cout : STD_LOGIC_VECTOR (7 downto 0);
signal Zero_bit : STD_LOGIC := '0';

begin
-- Lin <= '0'
ALU0: ALU_Slice port map(ReadDataA(0), ReadDataB(0), Zero_bit, OP, Ztemp(0), cout(0), cout(1));
ALU1: ALU_Slice port map(ReadDataA(1), ReadDataB(1), cout(0), OP, Ztemp(1), cout(1), cout(2));
ALU2: ALU_Slice port map(ReadDataA(2), ReadDataB(2), cout(1), OP, Ztemp(2), cout(2), cout(3));
ALU3: ALU_Slice port map(ReadDataA(3), ReadDataB(3), cout(2), OP, Ztemp(3), cout(3), cout(4));
ALU4: ALU_Slice port map(ReadDataA(4), ReadDataB(4), cout(3), OP, Ztemp(4), cout(4), cout(5));
ALU5: ALU_Slice port map(ReadDataA(5), ReadDataB(5), cout(4), OP, Ztemp(5), cout(5), cout(6));
ALU6: ALU_Slice port map(ReadDataA(6), ReadDataB(6), cout(5), OP, Ztemp(6), cout(6), cout(7));
ALU7: ALU_Slice port map(ReadDataA(7), ReadDataB(7), cout(6), OP, Ztemp(7), cout(7), Zero_bit);
-- Hin <= '0'
map1: process(ReadDataA, ReadDataB, OP, ZTemp)
begin
if OP = "0100" then -- negation 
    Result <= (not Ztemp) + 1;
elsif OP = "0110" then  -- subtraction
    Result <= ReadDataA + (not ReadDataB) + 1;
elsif OP = "0111" then  -- reverse subtraction
    Result <= ReadDataB + (not ReadDataA) + 1;
elsif OP = "1010" then  -- left rotate
    Result(7 downto 1) <=  Ztemp(7 downto 1);
    Result(0) <= ReadDataA(7);
elsif OP = "1011" then  -- right rotate
    Result(6 downto 0) <=  Ztemp(6 downto 0);
    Result(7) <= ReadDataA(0);
else
    Result <= Ztemp;
end if;
end process; 

end Behavioral;