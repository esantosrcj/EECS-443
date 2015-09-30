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
           OP        : in STD_LOGIC_VECTOR (1 downto 0);    --operation control
           Result    : out STD_LOGIC_VECTOR (7 downto 0));  --result
end ALU;

architecture Behavioral of ALU is

component ALU_Slice is
    Port ( A_bit : in STD_LOGIC;
           B_bit : in STD_LOGIC;
           OP : in STD_LOGIC_VECTOR (1 downto 0);
           AB_out : out STD_LOGIC);
end component ALU_Slice;

begin

ALU0: ALU_Slice port map(ReadDataA(0), ReadDataB(0), OP, Result(0));
ALU1: ALU_Slice port map(ReadDataA(1), ReadDataB(1), OP, Result(1));
ALU2: ALU_Slice port map(ReadDataA(2), ReadDataB(2), OP, Result(2));
ALU3: ALU_Slice port map(ReadDataA(3), ReadDataB(3), OP, Result(3));
ALU4: ALU_Slice port map(ReadDataA(4), ReadDataB(4), OP, Result(4));
ALU5: ALU_Slice port map(ReadDataA(5), ReadDataB(5), OP, Result(5));
ALU6: ALU_Slice port map(ReadDataA(6), ReadDataB(6), OP, Result(6));
ALU7: ALU_Slice port map(ReadDataA(7), ReadDataB(7), OP, Result(7));

end Behavioral;