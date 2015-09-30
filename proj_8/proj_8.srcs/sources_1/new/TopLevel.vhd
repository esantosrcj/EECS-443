----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2015 04:14:56 PM
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
use WORK.MEM_UTILS.ALL, STD.TEXTIO.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TopLevel is
    Port (--SW 	        : in  STD_LOGIC_VECTOR (15 downto 0);
          --BTN         : in  STD_LOGIC_VECTOR (4 downto 0);
          Clock_top      : in STD_LOGIC;
          PB_top         : in STD_LOGIC_VECTOR (4 downto 0);
          SW_top         : in STD_LOGIC_VECTOR (15 downto 0);
          
          LED_top        : out STD_LOGIC_VECTOR (15 downto 0));
end TopLevel;

architecture Structural of TopLevel is

component RegFile is
    Port ( M_Clock : in STD_LOGIC;
           WriteEnable : in STD_LOGIC;-- PBWrite_top
           PBClearReg : in STD_LOGIC;
           
           WriteAddr : in STD_LOGIC_VECTOR (4 downto 0);--SW(15:11)
           WriteData : in STD_LOGIC_VECTOR (7 downto 0);--SW(7:0)
           ReadAddrA : in STD_LOGIC_VECTOR (4 downto 0);--SW(15:11)
           ReadAddrB : in STD_LOGIC_VECTOR (4 downto 0);--SW(10:6)
           
           ReadDataA : out STD_LOGIC_VECTOR (7 downto 0);--W(i)
           ReadDataB : out STD_LOGIC_VECTOR (7 downto 0));--X(i)
end component RegFile;

component Convolutor is
    Port ( M_Clock : in STD_LOGIC;
           W : in STD_LOGIC_VECTOR (7 downto 0); -- ReadDataA
           X : in STD_LOGIC_VECTOR (7 downto 0); -- ReadDataB
           PBConv : in STD_LOGIC;   -- convolution push button
           PBClearSUM: in STD_LOGIC;    -- clear push button
           
           SUM : out STD_LOGIC_VECTOR (23 downto 0);    -- SUM
           MultRes : out STD_LOGIC_VECTOR (15 downto 0));-- multiplication product
end component Convolutor;

component Multiplexer is
    Port ( --M_Clock : in STD_LOGIC;
           DataA : in STD_LOGIC_VECTOR (7 downto 0);-- 8-bits
           SUM : in STD_LOGIC_VECTOR (23 downto 0);     -- 24-bits
           MultRes : in STD_LOGIC_VECTOR (15 downto 0); -- 16-bits
           SEL : in STD_LOGIC_VECTOR (1 downto 0);      -- 2-bits
           PBRead : in STD_LOGIC;
           
           LEDout : out STD_LOGIC_VECTOR (15 downto 0));       -- 16-bits
end component Multiplexer;

-- Register File --
signal DataA_top : byte;    -- also for W(i) (convolutor), MUX
signal DataB_top : byte;    -- also for X(j) (convolutor)
signal PBClearReg_top : STD_LOGIC;  -- clear register file
signal PBWrite_top : STD_LOGIC;

-- Convolutor --
signal PBConv_top : STD_LOGIC;
signal PBClearSUM_top : STD_LOGIC;
signal SUM_top : STD_LOGIC_VECTOR (23 downto 0); -- also for MUX
signal Mult_top : STD_LOGIC_VECTOR (15 downto 0);-- also for MUX

-- Multiplexer --
signal PBRead_top : STD_LOGIC;
signal LEDout_top : STD_LOGIC_VECTOR (15 downto 0);

begin

Reg: RegFile port map(Clock_top, PBWrite_top, PBClearReg_top, SW_top(15 downto 11), SW_top(7 downto 0), SW_top(15 downto 11), SW_top(10 downto 6), DataA_top, DataB_top);
Conv: Convolutor port map(Clock_top, DataA_top, DataB_top, PBConv_top, PBClearSUM_top, SUM_top, Mult_top);
Mux: Multiplexer port map(DataA_top, SUM_top, Mult_top, SW_top(1 downto 0), PBRead_top, LEDout_top);

LED_top <= LEDout_top(15 downto 0);

PBClearReg_top <= PB_top(0);-- Right button
PBRead_top <= PB_top(1);    -- Down button
PBWrite_top <= PB_top(2);   -- Up button
PBClearSUM_top <= PB_top(3);-- Left button
PBConv_top <= PB_top(4);    -- Center button
--PB_top(PBConv_top, PBClearSUM_top, PBWrite_top, PBRead_top, PBClearReg_top)
--PB_top(Center, Left, Up, Down, Right)

end Structural;
