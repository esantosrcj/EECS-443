----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2015 04:15:38 PM
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
    Port ( M_Clock : in STD_LOGIC;
           PBRead : in STD_LOGIC;
           ResultALU : in STD_LOGIC_VECTOR (7 downto 0);
           LEDout : out STD_LOGIC_VECTOR (7 downto 0));
end Holder;

architecture Behavioral of Holder is

begin
process (PBRead, ResultALU, M_Clock)

begin
if rising_edge(M_Clock) then
    if PBRead = '1' then --If ReadPB is active, load ResultALU to LED
        LEDout (7 downto 0) <= ResultALU (7 downto 0);
    else
        null; --Otherwise, do nothing
    end if;
end if;
end process;
end Behavioral;