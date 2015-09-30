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
    Port ( A_bit : in STD_LOGIC;
           B_bit : in STD_LOGIC;
           OP : in STD_LOGIC_VECTOR (1 downto 0);
           AB_out : out STD_LOGIC);
end ALU_Slice;

architecture Behavioral of ALU_Slice is

begin
process(A_bit, B_bit, OP)
variable temp : STD_LOGIC;

begin
if OP = "00" then       --data bit from ReadDataA
    temp := A_bit;
elsif OP = "01" then    --logical AND
    temp := A_bit and B_bit;
elsif OP = "10" then    --logical OR
    temp := A_bit or B_bit;
elsif OP = "11" then    --logical XOR
    temp := A_bit xor B_bit;
else
    null;               --otherwise, do nothing
end if;

AB_out <= temp;
end process;
end Behavioral;
