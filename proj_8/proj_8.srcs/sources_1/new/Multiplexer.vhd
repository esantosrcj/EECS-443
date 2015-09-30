----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2015 03:09:21 PM
-- Design Name: 
-- Module Name: Multiplexer - Behavioral
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

entity Multiplexer is
    Port(  DataA : in STD_LOGIC_VECTOR (7 downto 0);-- 8-bits
           SUM : in STD_LOGIC_VECTOR (23 downto 0);     -- 24-bits
           MultRes : in STD_LOGIC_VECTOR (15 downto 0); -- 16-bits
           SEL : in STD_LOGIC_VECTOR (1 downto 0);      -- 2-bits
           PBRead : in STD_LOGIC;
           
           LEDout : out STD_LOGIC_VECTOR (15 downto 0));-- 16-bits
end Multiplexer;

architecture Behavioral of Multiplexer is

begin
process(DataA, SUM, MultRes, SEL, PBRead)

begin
    if (PBRead = '1') then
        if (SEL = "00") then
            LEDout (15 downto 0) <= X"00" & DataA;
        elsif (SEL = "01") then
            LEDout (15 downto 0) <= SUM(15 downto 0);
        elsif (SEL = "10") then
            LEDout (15 downto 0) <= MultRes;
        else
            null;
        end if;
    else
        null;
    end if;
end process;
end Behavioral;
