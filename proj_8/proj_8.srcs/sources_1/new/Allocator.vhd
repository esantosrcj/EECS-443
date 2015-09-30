----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2015 09:34:38 PM
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
      WriteEnable : out STD_LOGIC;
      WriteDataOut : out byte;
      WriteAddrOut : out STD_LOGIC_VECTOR (4 downto 0);
      ReadAddrAOut : out STD_LOGIC_VECTOR (4 downto 0);
      ReadAddrBOut : out STD_LOGIC_VECTOR (4 downto 0);
      
      SEL : out STD_LOGIC_VECTOR (1 downto 0);
      SW : in STD_LOGIC_VECTOR (15 downto 0);
      PBRead : in STD_LOGIC;
      PBWrite : in STD_LOGIC);
end Allocator;

architecture Behavioral of Allocator is

begin
process(M_Clock, PBRead, PBWrite, SW)

begin
if rising_edge(M_Clock) then
    if PBWrite = '1' then   --if write push button is active
        WriteEnable <= '1';
        WriteDataOut <= SW(7 downto 0);
        WriteAddrOut <= SW(15 downto 11);
    elsif PBRead = '1' then --if read push button is active
        WriteEnable <= '0';
        ReadAddrAOut <= SW(15 downto 11);
        ReadAddrBOut <= SW(10 downto 6);
        SEL <= SW(1 downto 0);
    else
        WriteEnable <= '0';
    end if;
end if;
end process;
end Behavioral;
