----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2015 09:29:39 PM
-- Design Name: 
-- Module Name: RGBLed - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top is
    Port ( Clk        : in STD_LOGIC;
           SWtop      : in STD_LOGIC_VECTOR(11 downto 0);
           Color      : in STD_LOGIC_VECTOR(15 downto 13);
           
           -- LED16 PWM output signals
           PWM1_red   : out STD_LOGIC;
           PWM1_green : out STD_LOGIC;
           PWM1_blue  : out STD_LOGIC;
           
           -- LED 17 PWM output signals
           PWM2_red   : out STD_LOGIC;
           PWM2_green : out STD_LOGIC;
           PWM2_blue  : out STD_LOGIC);
end Top;

architecture Structural of Top is

component RgbPWM is
    Port ( Clck   : in STD_LOGIC;
           SW     : in STD_LOGIC_VECTOR(3 downto 0);
           Count  : in STD_LOGIC_VECTOR(31 downto 0);
           Period : in STD_LOGIC_VECTOR(31 downto 0);
           Color  : in STD_LOGIC;
           
           PWM    : out STD_LOGIC);
end component RgbPWM;

component Cnt is
    Port ( M_Clock  : in STD_LOGIC;
           PerValue : in STD_LOGIC_VECTOR(31 downto 0);
           
           CntValue : out STD_LOGIC_VECTOR(31 downto 0));
end component Cnt;
-- 1 000 000
constant PWMPeriod : STD_LOGIC_VECTOR(31 downto 0) := X"000F4240";
-- PWM red, green, and blue signals
signal red, green, blue : STD_LOGIC;
-- Counter for red, green, and blue
signal Cnt1, Cnt2, Cnt3 : STD_LOGIC_VECTOR(31 downto 0);

begin
-- LD16
PWM1_red <= red;
PWM1_green <= green;
PWM1_blue <= blue;
-- LD17
PWM2_red <= red;
PWM2_green <= green;
PWM2_blue <= blue;

C1: Cnt port map(Clk, PWMPeriod, Cnt1);
PWMR: RgbPWM port map(Clk, SWtop(11 downto 8), Cnt1, PWMPeriod, Color(15), red);
C2: Cnt port map(Clk, PWMPeriod, Cnt2);
PWMG: RgbPWM port map(Clk, SWtop(7 downto 4), Cnt2, PWMPeriod, Color(14), green);
C3: Cnt port map(Clk, PWMPeriod, Cnt3);
PWMB: RgbPWM port map(Clk, SWtop(3 downto 0), Cnt3, PWMPeriod, Color(13), blue);
end Structural;
