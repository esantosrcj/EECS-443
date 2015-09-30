----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2015 06:45:49 PM
-- Design Name: 
-- Module Name: PMW - Behavioral
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

--entity PMW is
--    Port ( Clk : in STD_LOGIC;
--           Reset: in STD_LOGIC;
--           Enable : in STD_LOGIC;
--           Duty : in STD_LOGIC;
           
--           PWMOut : out STD_LOGIC);
--end PMW;

entity PMW is
    Port ( Clk : in STD_LOGIC;
           LoadVal : in STD_LOGIC_VECTOR (31 downto 0);
           CountVal : in STD_LOGIC_VECTOR (31 downto 0);
           Duty : in STD_LOGIC_VECTOR (31 downto 0);
           
           LED : out STD_LOGIC);
end PMW;

architecture Behavioral of PMW is

--To generate a PWM signal you will need the following:
--1. A clock signal
--2. A value to define the PWM period
--3. A counter to measure (determine) the state of the PWM period
--4. A value to determine the PWM duty cycle (Width)

--The basic algorithm is:
--1. Load a counter with the value of hte PWM period
--2. Set the PWM output to '1'
--3. Decrement the counter based on the clock
--4. Compare the PWM counter to the duty cylce value, when equal
--    set the PWM output to '0'
--5. When the PWM counter is zero, reset the load value of the
--    PWM period

signal Count : STD_LOGIC := '1'; -- set count to true

begin
process(Clk)

begin
    if (rising_edge(Clk)) then -- if it is the rising edge
        if (CountVal = LoadVal) then -- if count value equals load value
            LED <= '1'; -- set LED to one
        elsif (CountVal = Duty) then -- if count value equals duty value
            LED <= '0'; -- set LED to zero
        else
            null; -- do nothing
        end if;
    end if;

end process;
end Behavioral;
