----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2015 03:41:14 PM
-- Design Name: 
-- Module Name: Top - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top is
    Port ( Clk : in STD_LOGIC;
           --SW : in STD_LOGIC_VECTOR (1 downto 0);
           Rst : in STD_LOGIC;-- Down button
           BtnL : in STD_LOGIC;
           BtnR : in STD_LOGIC;
           
           LED16_red : out STD_LOGIC;
           LED16_green : out STD_LOGIC;
           LED16_blue : out STD_LOGIC;
           
           LED17_red : out STD_LOGIC;
           LED17_green : out STD_LOGIC;
           LED17_blue : out STD_LOGIC);
end Top;

architecture Structural of Top is

component RGBLed is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           
           BtnL : in STD_LOGIC;
           BtnR : in STD_LOGIC;
           
           -- LED16 PWM output signals
           PWM1_red : out STD_LOGIC;
           PWM1_green : out STD_LOGIC;
           PWM1_blue : out STD_LOGIC;
           
           -- LED 17 PWM output signals
           PWM2_red : out STD_LOGIC;
           PWM2_green : out STD_LOGIC;
           PWM2_blue : out STD_LOGIC);
end component RGBLed;

begin

--TriLEDs: RGBLed port map (Clk, Rst, BtnL, BtnR, LED16_red, LED16_green, LED16_blue, LED17_red, LED17_green, LED17_blue);

end Structural;
