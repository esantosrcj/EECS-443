----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2015 03:48:33 PM
-- Design Name: 
-- Module Name: ReadOnlyMem - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use WORK.MEM_UTILS.ALL, STD.TEXTIO.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ReadOnlyMem is
    Port ( Clk : in STD_LOGIC;
           Enable : in STD_LOGIC;
           ReadAddr : in STD_LOGIC_VECTOR (4 downto 0);
           
           ReadData : out STD_LOGIC_VECTOR (31 downto 0));
end ReadOnlyMem;

architecture Behavioral of ReadOnlyMem is

begin
process(Clk, Enable, ReadAddr)

Type Mem is array (0 to 63) of STD_LOGIC_VECTOR(31 downto 0);-- 32 words
Variable ROM : Mem; --We define a new variable RegMemo f the type Mem.
Function bv2nat (bv : STD_LOGIC_VECTOR (4 downto 0)) return natural is
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
    for i in 0 to 63 loop
        ROM(i) := STD_LOGIC_VECTOR(to_unsigned(i, ReadData'length));--(i + 1)*2;
    end loop;
    
    if (rising_edge(Clk)) then
        if (Enable = '1') then
            --display ReadData at ReadAddr
            ReadData <= ROM(bv2nat(ReadAddr));
        else
            null;
        end if;
    end if;
end process;
end Behavioral;
