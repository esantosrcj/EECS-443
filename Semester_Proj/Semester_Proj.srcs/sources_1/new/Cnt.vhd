----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/06/2015 11:52:39 PM
-- Design Name: 
-- Module Name: Cnt - Behavioral
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

entity Cnt is
    Port ( M_Clock  : in STD_LOGIC;
           PerValue : in STD_LOGIC_VECTOR(31 downto 0);
           
           CntValue : out STD_LOGIC_VECTOR(31 downto 0));
end Cnt;

architecture Behavioral of Cnt is

signal count : STD_LOGIC_VECTOR(31 downto 0) := (OTHERS => '0');

begin
process(M_Clock)
begin
    if (rising_edge(M_Clock)) then
        if (count = X"00000000") then
            count <= PerValue;
        else
            count <= count - 1;
        end if;
        CntValue <= count;
    end if;
end process;
end Behavioral;
