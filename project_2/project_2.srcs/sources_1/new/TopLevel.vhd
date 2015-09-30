----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2015 10:08:24 AM
-- Design Name: 
-- Module Name: TopLevel - Behavioral
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

entity TopLevel is
    Port ( --SW 			  : in  STD_LOGIC_VECTOR (15 downto 0);
        --  BTN             : in  STD_LOGIC_VECTOR (4 downto 0);
          CLK             : in  STD_LOGIC;
          LEDtop             : out  STD_LOGIC_VECTOR (15 downto 0)
--          SSEG_CA         : out  STD_LOGIC_VECTOR (7 downto 0);
--          SSEG_AN         : out  STD_LOGIC_VECTOR (7 downto 0);
--          UART_TXD        : out  STD_LOGIC;
--          RGB1_Red        : out  STD_LOGIC;
--          RGB1_Green      : out  STD_LOGIC;
--          RGB1_Blue       : out  STD_LOGIC;    
--          RGB2_Red        : out  STD_LOGIC;
--          RGB2_Green      : out  STD_LOGIC;
--          RGB2_Blue       : out  STD_LOGIC;
--          micClk          : out STD_LOGIC;
--          micLRSel        : out STD_LOGIC;
--          micData         : in STD_LOGIC;
--          ampPWM          : out STD_LOGIC;
        --  ampSD           : out STD_LOGIC     
          );
end TopLevel;

architecture Structural of TopLevel is

component Count32 is
    Port ( M_Clock : in STD_LOGIC;
           CountValue : out STD_LOGIC_VECTOR (32 downto 1));
end component Count32;

component EventGen is
    Port ( CountValue : in STD_LOGIC_VECTOR (32 downto 1);
           Events : out STD_LOGIC_VECTOR (32 downto 1));
end component EventGen;

component DFlipFlop is
    Port ( Clock_H : in STD_LOGIC;
           Reset_H : in STD_LOGIC;
           Set_H : in STD_LOGIC;
           Enable_H : in STD_LOGIC;
           D_H : in STD_LOGIC;
           Q_H : out STD_LOGIC);
end component DFlipFlop;

signal CV_top, Events_top: STD_LOGIC_VECTOR (32 downto 1);
signal Q_top : std_logic; 

begin
Count: Count32 port map (M_Clock => CLK, CountValue=> CV_top);--CountValue(32 downto 25));
EGen: EventGen port map(CountValue => CV_top, Events => Events_top);
DFF: DFlipFlop port map(Clock_H=> CLK, Q_H => Q_top, D_H => not Q_top, Set_H => '0', 
Reset_H => '0', Enable_H => Events_top(25)); 

LEDtop(8 downto 1) <= CV_top (32 downto 25);
LEDtop(0) <= Q_top; --CV_top (32 downto 25);

end Structural;
