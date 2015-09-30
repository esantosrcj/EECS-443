----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2015 08:48:23 PM
-- Design Name: 
-- Module Name: ALU_Slice - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_Slice is
    Port ( A_bit : in STD_LOGIC;   -- first input
           B_bit : in STD_LOGIC;   -- second input
           Lin : in STD_LOGIC;  -- shift input bit
           OP : in STD_LOGIC_VECTOR (3 downto 0);
           Z : out STD_LOGIC;   -- output
           
           Hout : out STD_LOGIC;-- shift output
           Hin : in STD_LOGIC);  -- carry input bit
end ALU_Slice;

architecture Behavioral of ALU_Slice is

signal SUMTemp, CoutTemp : STD_LOGIC;

begin

process(A_bit, B_bit, Hin, Lin, OP)
variable temp : STD_LOGIC := '0';
begin

if OP = "0000" then     -- data bit from ReadDataA
    temp := A_bit;
elsif OP = "0001" then  -- logical AND
    temp := A_bit and B_bit;
elsif OP = "0010" then  -- logical OR
    temp := A_bit or B_bit;
elsif OP = "0011" then  -- logical XOR
    temp := A_bit xor B_bit;
elsif OP = "0100" then  -- negation
    temp := A_bit;
elsif OP = "0101" then  -- addition
    temp := A_bit xor B_bit xor Lin;
    Hout <= (A_bit and Lin) or (B_bit and Lin) or (A_bit and B_bit);
elsif OP = "0110" then  -- subtraction
    null;
elsif OP = "0111" then  -- reverse subtraction
    null;
elsif OP = "1000" then  -- left shift
    Hout <= A_bit;
    temp := Lin;
elsif OP = "1001" then  -- right shift
    Hout <= A_bit;
    temp := Hin;
elsif OP = "1010" then  -- left rotate
    Hout <= A_bit;
    temp := Lin;
elsif OP = "1011" then  -- right rotate
    Hout <= A_bit;
    temp := Hin;
else
    null;               --otherwise, do nothing
end if;

Z <= temp;
end process;
end Behavioral;
