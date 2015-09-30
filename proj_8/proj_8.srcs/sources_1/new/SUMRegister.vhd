----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2015 05:52:49 PM
-- Design Name: 
-- Module Name: SUMRegister - Behavioral
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

entity SUMRegister is
    Port ( M_Clock : in STD_LOGIC;
           SUM : in STD_LOGIC_VECTOR (23 downto 0);
           
           PartSum : out STD_LOGIC_VECTOR (23 downto 0));
end SUMRegister;

architecture Behavioral of SUMRegister is

begin

process(M_Clock, SUM)

begin
    if (rising_edge(M_Clock)) then
        PartSum <= SUM;
    end if;
end process;
end Behavioral;
