----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/04/2015 04:04:21 PM
-- Design Name: 
-- Module Name: EventGen - Behavioral
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

entity EventGen is
    Port ( CountValue : in STD_LOGIC_VECTOR (32 downto 1);
           Events : out STD_LOGIC_VECTOR (32 downto 1));
end EventGen;

architecture Behavioral of EventGen is

begin
process(CountValue)
constant R : STD_LOGIC_VECTOR(32 downto 1) := (OTHERS => '1');
begin
for j in 32 downto 1 loop
    if CountValue(j downto 1) = R(j downto 1) then
        Events(j) <= '1';
    else
        Events(j) <= '0';
    end if;
end loop;
end process;
end Behavioral;
