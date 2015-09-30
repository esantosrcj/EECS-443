----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2015 02:55:27 PM
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

entity TopLevel is
    Port (--SW 	        : in  STD_LOGIC_VECTOR (15 downto 0);
          --BTN         : in  STD_LOGIC_VECTOR (4 downto 0);
          Clocktop      : in  STD_LOGIC;
          LEDtop        : out  STD_LOGIC_VECTOR (7 downto 0);
          PBtop         : in STD_LOGIC_VECTOR (4 downto 0);
          SWtop         : in STD_LOGIC_VECTOR (15 downto 0));
end TopLevel;

architecture Structural of TopLevel is

component RegFile is
    Port ( M_Clock : in STD_LOGIC;
           ReadAddrA : in nybble;
           ReadDataA : out byte;
           ReadAddrB : in nybble;
           ReadDataB : out byte;
           WriteEnable : in STD_LOGIC;
           WriteAddr : in nybble;
           WriteData : in byte);
end component RegFile;

component Allocator is
    Port (M_Clock : in STD_LOGIC;
          WriteENOut : out STD_LOGIC;
          WriteDataOut : out byte;
          WriteAddrOut : out nybble;
          ReadAddrAOut : out nybble;
          --ReadDataA : out byte;
          ReadAddrBOut : out nybble;
          --ReadDataB : out byte;
          
          OPOut: out STD_LOGIC_VECTOR (1 downto 0);
          SWin : in STD_LOGIC_VECTOR (15 downto 0);
          PBRin : in STD_LOGIC;
          PBWin : in STD_LOGIC);
end component Allocator;

component ALU is
    Port ( ReadDataA : in STD_LOGIC_VECTOR (7 downto 0);    --operand A
           ReadDataB : in STD_LOGIC_VECTOR (7 downto 0);    --operand B
           OP        : in STD_LOGIC_VECTOR (1 downto 0);    --operation control
           Result    : out STD_LOGIC_VECTOR (7 downto 0));  --result
end component ALU;

component Holder is
    Port ( M_Clock : in STD_LOGIC;
           PBRead : in STD_LOGIC;
           ResultALU : in STD_LOGIC_VECTOR (7 downto 0);
           LEDout : out STD_LOGIC_VECTOR (7 downto 0));
end component Holder;

component Delay is
    Port ( M_ClK : in STD_LOGIC;
           PushB : in STD_LOGIC;
           OutPB : out STD_LOGIC);
end component Delay;

-- Register File --
signal ReadAddrA_top : nybble;  -- also for Allocator
signal ReadDataA_top : byte;    -- also for ALU
signal ReadAddrB_top : nybble;  -- also for Allocator
signal ReadDataB_top : byte;    -- also for ALU
signal WriteEN_top : STD_LOGIC; -- also for Allocator
signal WriteAddr_top : nybble;  -- also for Allocator
signal WriteData_top : byte;    -- also for Allocator

-- Allocator --
signal OP_top : STD_LOGIC_VECTOR (1 downto 0); -- also for ALU
signal PBRin_top : STD_LOGIC;
signal PBWin_top : STD_LOGIC;

-- ALU --
signal Result_top : STD_LOGIC_VECTOR (7 downto 0);

-- Holder --
signal LEDout_top : STD_LOGIC_VECTOR (7 downto 0);

-- Delay --
signal PBRead_top : STD_LOGIC;
signal PBWrite_top : STD_LOGIC;

begin
D1: Delay port map(Clocktop, PBRead_top, PBRin_top);
D2: Delay port map(Clocktop, PBWrite_top, PBWin_top);
Reg: RegFile port map(Clocktop, ReadAddrA_top, ReadDataA_top, ReadAddrB_top, ReadDataB_top, WriteEN_top, WriteAddr_top, WriteData_top);
Allo: Allocator port map(Clocktop, WriteEN_top, WriteData_top, WriteAddr_top, ReadAddrA_top, ReadAddrB_top, OP_top, SWtop, PBRin_top, PBWin_top);
ALUcomp: ALU port map(ReadDataA_top, ReadDataB_top, OP_top, Result_top);
Hold: Holder port map(Clocktop, PBRin_top, Result_top, LEDout_top);

LEDtop <= LEDout_top(7 downto 0);

--RPB_top <= PBtop(1);
PBRead_top <= PBtop(1);
PBWrite_top <= PBtop(2);

end Structural;