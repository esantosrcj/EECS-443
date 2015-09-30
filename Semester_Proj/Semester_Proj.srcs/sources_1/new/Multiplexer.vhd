----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2015 03:53:28 PM
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
    Port ( Clk : in STD_LOGIC
           SEL : in STD_LOGIC_VECTOR (1 downto 0);      -- 2-bits
           
           Duty : out STD_LOGIC_VECTOR (31 downto 0);          
           LdValue : out STD_LOGIC_VECTOR (31 downto 0));
end Multiplexer;

architecture Behavioral of Multiplexer is

begin
process(Clk)

begin
--    if (PBRead = '1') then
--        if (SEL = "00") then
--            LEDout (15 downto 0) <= X"00" & DataA;
--        elsif (SEL = "01") then
--            LEDout (15 downto 0) <= SUM(15 downto 0);
--        elsif (SEL = "10") then
--            LEDout (15 downto 0) <= MultRes;
--        else
--            null;
--        end if;
--    else
--        null;
--    end if;
    if (rising_edge(Clk)) then
        
end process;
end Behavioral;
