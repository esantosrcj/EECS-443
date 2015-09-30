----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2015 12:37:47 PM
-- Design Name: 
-- Module Name: Sim - Behavioral
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

entity Sim is

end Sim;

architecture Behavioral of Sim is

component RGBLed is
    Port ( Clk : in STD_LOGIC;
           Rst : in STD_LOGIC;
           SWtop : in STD_LOGIC_VECTOR(7 downto 0);
           Color : in STD_LOGIC_VECTOR (15 downto 13);
           
           -- LED16 PWM output signals
           PWM1_red : out STD_LOGIC;
           PWM1_green : out STD_LOGIC;
           PWM1_blue : out STD_LOGIC;
           
           -- LED 17 PWM output signals
           PWM2_red : out STD_LOGIC;
           PWM2_green : out STD_LOGIC;
           PWM2_blue : out STD_LOGIC);
end component RGBLed;

signal Clock, Reset : STD_LOGIC;
signal SW : STD_LOGIC_VECTOR (7 downto 0);
signal Clr : STD_LOGIC_VECTOR (15 downto 3);

signal pwm1_r, pwm1_g, pwm1_b, pwm2_r, pwm2_g, pwm2_b : STD_LOGIC;

begin

C: RGBLed port map(Clock, Reset, SW, Clr, pwm1_r, pwm1_g, pwm1_b, pwm2_r, pwm2_g, pwm2_b);

process
begin
    
    Clr(15 downto 13) <= "000"; -- no color is selected
    SW(7 downto 0) <= "00000000";-- no instensity
    wait for 10ns;

    Clr(15 downto 13) <= "100"; -- red
    SW(7 downto 0) <= "00001111";-- s^5 - 1 * 3906
    wait for 10ns;
    
    Clr(15 downto 13) <= "010"; -- green
    SW(7 downto 0) <= "00001111";-- s^5 - 1 * 3906
    wait for 10ns;
    
    Clr(15 downto 13) <= "001"; -- blue
    SW(7 downto 0) <= "00001111";-- s^5 - 1 * 3906
    wait for 10ns;

    Clr(15 downto 13) <= "110"; -- red and green
    SW(7 downto 0) <= "00001111";-- s^5 - 1 * 3906
    wait for 10ns;

    Clr(15 downto 13) <= "011"; -- green and blue
    SW(7 downto 0) <= "00001111";-- s^5 - 1 * 3906
    wait for 10ns;

end process;

ClkGen: process  -- This is the process that generates clock signal 
begin  -- clock frequency is 2 ns per cycle 
    Clock <= '1';
    wait for 5ns;

    Clock <= '0';
    wait for 5ns;
    
end process;
end Behavioral;
