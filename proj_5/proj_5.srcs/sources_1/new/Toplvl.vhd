----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2015 04:34:49 PM
-- Design Name: 
-- Module Name: Toplvl - Behavioral
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
use work.mem_utils.all, std.textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Toplvl is
    Port (--SW 	        : in  STD_LOGIC_VECTOR (15 downto 0);
          --BTN         : in  STD_LOGIC_VECTOR (4 downto 0);
          M_CLKtop      : in  STD_LOGIC;
          LEDtop        : out  STD_LOGIC_VECTOR (7 downto 0);
          PBtop         : in STD_LOGIC_VECTOR (4 downto 0);
          SWtop         : in STD_LOGIC_VECTOR (15 downto 0));
end Toplvl;

architecture Structural of Toplvl is

component RegFile is
    Port ( M_Clock : in STD_LOGIC;
           ReadAddrA : in nybble;
           ReadDataA : out byte;
           --ReadAddrB : in nybble;
           --ReadDataB : out byte;
           WriteEnable : in STD_LOGIC;
           WriteAddr : in nybble;
           WriteData : in byte);
end component RegFile;

component Holder is
    Port ( ReadPB : in STD_LOGIC;
           ReadDataA : in STD_LOGIC_VECTOR (7 downto 0);
           LEDout : out STD_LOGIC_VECTOR (7 downto 0);
           M_CLK : in STD_LOGIC);
end component Holder;

component Switcher is
    Port ( RPB : in STD_LOGIC;
           WPB : in STD_LOGIC;
           M_CLCK : in STD_LOGIC;
           WriteEN : out STD_LOGIC);
end component Switcher;

component Delay is
    Port ( PushB : in STD_LOGIC;
           M_ClK : in STD_LOGIC;
           OutPB : out STD_LOGIC);
end component Delay;

signal ReadAddrA_top : nybble;
signal ReadDataA_top : byte;
signal WriteEN_top : STD_LOGIC;
signal WriteAddr_top : nybble;
signal WriteData_top : byte;

signal RPB_top : STD_LOGIC;
signal WPB_top : STD_LOGIC;

signal ReadPB_top : STD_LOGIC;
signal WritePB_top : STD_LOGIC;
signal LEDout_top : STD_LOGIC_VECTOR (7 downto 0);

begin
D1: Delay port map(M_CLK => M_CLKtop, PushB => ReadPB_top, OutPB => RPB_top);
D2: Delay port map(M_CLK => M_CLKtop, PushB => WritePB_top, OutPB => WPB_top);
Reg: RegFile port map(M_Clock => M_CLKtop, ReadAddrA => ReadAddrA_top, ReadDataA => ReadDataA_top, WriteAddr => WriteAddr_top, WriteData => WriteData_top, WriteEnable => WriteEN_top);
Swi: Switcher port map(M_CLCK => M_CLKtop, WriteEN => WriteEN_top, RPB => RPB_top, WPB => WPB_top);
Hol: Holder port map(M_CLK => M_CLKtop, ReadDataA => ReadDataA_top, LEDout => LEDout_top, ReadPB => ReadPB_top);

WriteData_top <= SWtop(7 downto 0);
ReadAddrA_top <= SWtop(15 downto 12);
WriteAddr_top <= SWtop(15 downto 12);

LEDtop <= LEDout_top(7 downto 0);

--RPB_top <= PBtop(1);
ReadPB_top <= PBtop(1);
WritePB_top <= PBtop(2);

end Structural;