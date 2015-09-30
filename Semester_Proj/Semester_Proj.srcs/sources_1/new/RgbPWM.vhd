----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2015 09:16:52 AM
-- Design Name: 
-- Module Name: RgbPWM - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RgbPWM is
    Port ( Clck   : in STD_LOGIC;
           SW     : in STD_LOGIC_VECTOR(3 downto 0);
           Count  : in STD_LOGIC_VECTOR(31 downto 0);
           Period : in STD_LOGIC_VECTOR(31 downto 0);
           Color  : in STD_LOGIC;
           
           PWM    : out STD_LOGIC);
end RgbPWM;

architecture Behavioral of RgbPWM is
-- 31250
constant Delay : STD_LOGIC_VECTOR(27 downto 0) := X"0007A12";
-- Duty cycle
signal Dty : STD_LOGIC_VECTOR(31 downto 0) := (OTHERS => '0');

begin
process(Clck)
begin
    if (rising_edge(Clck)) then        
        if (Color = '1') then
            Dty <= (SW * Delay);
            if (Count = Period) then
                PWM <= '0';
            elsif (Count = Dty) then
                PWM <= '1';
            end if;
        end if;
    end if;
end process;  
end Behavioral;
