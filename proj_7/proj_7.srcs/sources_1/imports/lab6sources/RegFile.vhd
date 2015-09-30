----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2015 04:12:12 PM
-- Design Name: 
-- Module Name: RegFile - Behavioral
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

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2015 04:32:06 PM
-- Design Name: 
-- Module Name: RegFile - Behavioral
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

entity RegFile is
    Port ( M_Clock : in STD_LOGIC;
           ReadAddrA : in nybble;
           ReadDataA : out byte;
           ReadAddrB : in nybble;
           ReadDataB : out byte;
           WriteEnable : in STD_LOGIC;
           WriteAddr : in nybble;
           WriteData : in byte);
end RegFile;

architecture Behavioral of RegFile is
begin
process(M_Clock, ReadAddrA, WriteEnable, WriteAddr, WriteData)

Type Mem is array (0 to 15) of byte;
Variable RegMem : Mem; --We define a new variable RegMemof the type Mem.
Function bv2nat (bv: nybble) return natural is
    variable tmp : natural := 0;
begin
    for i in bv'high downto bv'low loop
        tmp := tmp*2;
        if bv(i) = '1' then
            tmp := tmp + 1;
        end if;
    end loop;
    return tmp;
end function bv2nat;  --declare a function

begin
if (rising_edge(M_Clock)) then
    ReadDataA <= RegMem(bv2nat(ReadAddrA));
    ReadDataB <= RegMem(bv2nat(ReadAddrB));
    if WriteEnable = '1' then
        RegMem(bv2nat(WriteAddr)) := WriteData;
    end if;
end if;
end process;
end Behavioral;

