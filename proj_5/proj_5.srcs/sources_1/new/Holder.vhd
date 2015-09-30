----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2015 04:22:19 PM
-- Design Name: 
-- Module Name: Holder - Behavioral
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

entity Holder is
    Port ( ReadPB : in STD_LOGIC;
           ReadDataA : in STD_LOGIC_VECTOR (7 downto 0);
           LEDout : out STD_LOGIC_VECTOR (7 downto 0);
           M_CLK : in STD_LOGIC);
end Holder;

architecture Behavioral of Holder is

begin
process (ReadPB, ReadDataA, M_CLK)

begin
if rising_edge(M_CLK) then
    if ReadPB = '1' then --If ReadPB is active, load ReadDataA to LED
        LEDout (7 downto 0) <= ReadDataA (7 downto 0);
    else
        null; --Otherwise, do nothing
    end if;
end if;
end process;
end Behavioral;
