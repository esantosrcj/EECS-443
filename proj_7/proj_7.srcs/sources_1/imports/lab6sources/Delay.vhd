----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2015 07:14:12 PM
-- Design Name: 
-- Module Name: Delay - Behavioral
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

entity Delay is
    Port ( PushB : in STD_LOGIC;
           M_ClK : in STD_LOGIC;
           OutPB : out STD_LOGIC);
end Delay;

architecture Behavioral of Delay is

component Count32 is
    Port ( M_Clock : in STD_LOGIC;
           CountValue : out STD_LOGIC_VECTOR (31 downto 0));
end component Count32;

component EventGen is
    Port ( CountValue : in STD_LOGIC_VECTOR (31 downto 0);
           Events : out STD_LOGIC_VECTOR (31 downto 0));
end component EventGen;

signal CValue : STD_LOGIC_VECTOR (31 downto 0);
signal Evnts : STD_LOGIC_VECTOR (31 downto 0);

begin
Count: Count32 port map(M_Clock => M_CLK, CountValue => CValue);
Evnt: EventGen port map(CountValue => CValue, Events => Evnts);

process(PushB, M_CLK, Evnts)
variable button_press : STD_LOGIC;

begin
if ((Evnts(17) = '1') and (PushB = '1')) then
    button_press := '1';
else
    button_press := '0';
end if;

if ((Evnts(19) = '1') and (button_press = '1')) then
    OutPB <= '1';
else
    OutPB <= '0';
end if;

end process;
end Behavioral;
