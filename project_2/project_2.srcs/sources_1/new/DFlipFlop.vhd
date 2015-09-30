----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/04/2015 04:35:14 PM
-- Design Name: 
-- Module Name: DFlipFlop - Behavioral
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

entity DFlipFlop is
    Port ( Clock_H : in STD_LOGIC;
           Reset_H : in STD_LOGIC;
           Set_H : in STD_LOGIC;
           Enable_H : in STD_LOGIC;
           D_H : in STD_LOGIC;
           Q_H : out STD_LOGIC);
end DFlipFlop;

architecture Behavioral of DFlipFlop is

begin
process( Clock_H, Reset_H,Set_H ,Enable_H,D_H)
begin
if(rising_edge(Clock_H))then
    if Reset_H = '1' then
        Q_H <= '0';
    elsif Set_H = '1' then
        Q_H <= '1';
    elsif Enable_H = '1' then --and Reset_H = '0' and Set_H = '0' then
        Q_H <= D_H;
    end if;
end if;
end process;
end Behavioral;
