----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2015 04:06:06 PM
-- Design Name: 
-- Module Name: Switcher - Behavioral
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

entity Switcher is
    Port ( RPB : in STD_LOGIC;
           WPB : in STD_LOGIC;
           M_CLCK : in STD_LOGIC;
           WriteEN : out STD_LOGIC);
end Switcher;

architecture Behavioral of Switcher is
begin
process(M_CLCK, WPB, RPB)

begin
if rising_edge(M_CLCK) then
    if WPB = '1' then --If WritePB is active, write
        WriteEN <= '1';
    elsif RPB = '1' then --If ReadPB is active, stop writing
        WriteEN <= '0';
    else
        WriteEN <= '0';
    end if;
end if;
end process;
end Behavioral;
