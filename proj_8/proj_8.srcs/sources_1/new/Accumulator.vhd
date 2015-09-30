----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2015 05:15:01 PM
-- Design Name: 
-- Module Name: Accumulator - Behavioral
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

entity Accumulator is
    Port (M_Clock : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (7 downto 0); -- ReadDataA
           B : in STD_LOGIC_VECTOR (7 downto 0); -- ReadDataB
           --PartSum : in STD_LOGIC_VECTOR (23 downto 0);
           PBConv : in STD_LOGIC;
           PBClearSUM : in STD_LOGIC;
           
           SUM : out STD_LOGIC_VECTOR (23 downto 0);
           Product : out STD_LOGIC_VECTOR (15 downto 0));
end Accumulator;

architecture Behavioral of Accumulator is

begin
process(M_Clock)
variable stemp : STD_LOGIC_VECTOR (23 downto 0) := (OTHERS => '0');
variable ptemp : STD_LOGIC_VECTOR (15 downto 0) := (OTHERS => '0');
variable prePB : std_logic;
begin
    if (rising_edge(M_Clock)) then
        if prePB = '0' and (PBConv = '1') then -- convolution push button is pressed
            ptemp := A*B;
            stemp := (X"00" & (A*B)) + stemp;
        elsif (PBClearSUM = '1') then -- clear push button is pressed
            ptemp := A*B;
            stemp := X"000000";        
        else
            null;   -- do nothing
        end if;
      prePB := PBConv;
      Product <= ptemp;
      SUM <= stemp;
    end if;
   
end process;
end Behavioral;
