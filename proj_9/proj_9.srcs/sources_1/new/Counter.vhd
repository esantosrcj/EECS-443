----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2015 01:32:20 PM
-- Design Name: 
-- Module Name: Counter - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter is
    Port ( Clk : in STD_LOGIC;
           Clear : in STD_LOGIC;
           Load : in STD_LOGIC;
           Up : in STD_LOGIC;
           LoadAddr : in STD_LOGIC_VECTOR (4 downto 0);
           Enable : in STD_LOGIC;
           
           Addr : out STD_LOGIC_VECTOR (4 downto 0));
end Counter;

architecture Behavioral of Counter is

begin
process(Clk, Clear, Load, Up, LoadAddr, Enable)
variable inner : STD_LOGIC_VECTOR (4 downto 0) := (OTHERS => '0');
variable updown : STD_LOGIC_VECTOR (4 downto 0) := (OTHERS => '0');

begin

    if (rising_edge(Clk)) then
        if (Enable = '1') then 
            if (Clear = '1') then
                inner := "00000";
                --Addr <= "00000";
            elsif (Load = '1') then
                inner := LoadAddr;
            else
            --elsif (rising_edge(Clk)) then
                if (Up = '1') then
                    if (inner = "11111") then
                        inner := "00000";
                    else
                        --inner := updown;
                        --updown := updown + 1;
                        inner := inner + 1;
                    end if;
                else
                    if (inner = "00000") then
                        inner := "11111";
                    else
                        --inner := updown;
                        --updown := updown - 1;
                        inner := inner - 1;
                    end if;
                end if;
            end if;
        else
            null;
        end if;
        --Addr <= inner;
    end if;
    Addr <= inner;
end process;
end Behavioral;
