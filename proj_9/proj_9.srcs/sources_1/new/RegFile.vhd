----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2015 04:33:51 PM
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
use WORK.MEM_UTILS.ALL, STD.TEXTIO.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegFile is
    Port ( M_Clock : in STD_LOGIC;
           WriteEnable : in STD_LOGIC;-- PBWrite_top
           PBClearReg : in STD_LOGIC;
           WriteAddr : in STD_LOGIC_VECTOR (4 downto 0);--SW(15:11)
           WriteData : in STD_LOGIC_VECTOR (7 downto 0);--SW(7:0)
           ReadAddrA : in STD_LOGIC_VECTOR (4 downto 0);--SW(15:11)
           ReadAddrB : in STD_LOGIC_VECTOR (4 downto 0);--SW(10:6)
           
           ReadDataA : out STD_LOGIC_VECTOR (7 downto 0);--W(i)
           ReadDataB : out STD_LOGIC_VECTOR (7 downto 0));--X(i)
end RegFile;

architecture Behavioral of RegFile is
begin
process(M_Clock, WriteEnable, PBClearReg, WriteAddr, WriteData, ReadAddrA, ReadAddrB)

Type Mem is array (0 to 31) of byte;-- 32 words
Variable RegMem : Mem; --We define a new variable RegMemo f the type Mem.
Function bv2nat (bv : nybble) return natural is
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

variable tempA : STD_LOGIC_VECTOR (7 downto 0) := (OTHERS => '0');
variable tempB : STD_LOGIC_VECTOR (7 downto 0) := (OTHERS => '0');

begin

if (rising_edge(M_Clock)) then
--    ReadDataA <= RegMem(bv2nat(ReadAddrA));
--    ReadDataB <= RegMem(bv2nat(ReadAddrB));
    
    if (WriteEnable = '1') then
        RegMem(bv2nat(WriteAddr)) := WriteData;
    elsif (PBClearReg = '1') then
        for i in 31 downto 0 loop
            RegMem(i) := (OTHERS => '0');
        end loop;
    else
        null;
    end if;
    tempA := RegMem(bv2nat(ReadAddrA));
    tempB := RegMem(bv2nat(ReadAddrB));
end if;

ReadDataA <= tempA;
ReadDataB <= tempB;
end process;
end Behavioral;
