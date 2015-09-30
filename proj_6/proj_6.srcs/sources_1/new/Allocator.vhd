----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2015 04:36:18 PM
-- Design Name: 
-- Module Name: Allocator - Behavioral
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

entity Allocator is
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
end Allocator;

architecture Behavioral of Allocator is

begin
process(M_Clock, PBRin, PBWin, SWin)

begin
if rising_edge(M_Clock) then
    if PBWin = '1' then   --if write push button is active
        WriteENout <= '1';
        WriteDataOut <= SWin(7 downto 0);
        WriteAddrOut <= SWin(15 downto 12);
        --OPOut <= Swtch(15 downto 14);
    elsif PBRin = '1' then --if read push button is active
        WriteENout <= '0';
        ReadAddrAOut <= SWin(15 downto 12);
        ReadAddrBOut <= SWin(11 downto 8);
        OPOut <= SWin(5 downto 4);
    else
        WriteENout <= '0';
    end if;
end if;
end process;
end Behavioral;
