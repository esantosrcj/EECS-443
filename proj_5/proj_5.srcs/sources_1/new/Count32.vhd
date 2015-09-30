----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2015 03:35:53 PM
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
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Count32 is
    Port ( M_Clock : in STD_LOGIC;
           CountValue : out STD_LOGIC_VECTOR (31 downto 0));
end Count32;

architecture Behavioral of Count32 is

begin
process(M_Clock)
variable X : STD_LOGIC_VECTOR (31 downto 0) := (others =>'0');
begin
if (rising_edge(M_Clock)) then
    X := X + 1;
    CountValue <= X;
end if;
end process;
end Behavioral;
