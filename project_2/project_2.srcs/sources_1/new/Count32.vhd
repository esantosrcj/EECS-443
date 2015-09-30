----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/04/2015 03:25:46 PM
-- Design Name: 
-- Module Name: Count32 - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Count32 is
    Port ( M_Clock : in STD_LOGIC;
           CountValue : out STD_LOGIC_VECTOR (32 downto 1));
end Count32;

architecture Behavioral of Count32 is

begin
process(M_Clock)
variable X : STD_LOGIC_VECTOR (32 downto 1) := (others =>'0'); --set logic vector to all zeros
begin
if (rising_edge(M_Clock)) then
    X := X + 1;
    CountValue <= X;
end if;
end process;
end Behavioral;
