----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2015 03:10:54 PM
-- Design Name: 
-- Module Name: Convolutor - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Convolutor is
    Port ( M_Clock : in STD_LOGIC;
           W : in STD_LOGIC_VECTOR (7 downto 0); -- ReadDataA
           X : in STD_LOGIC_VECTOR (7 downto 0); -- ReadDataB
           PBConv : in STD_LOGIC;   -- convolution push button
           PBClearSUM : in STD_LOGIC;    -- clear push button
           
           SUM : out STD_LOGIC_VECTOR (23 downto 0);    -- SUM
           MultRes : out STD_LOGIC_VECTOR (15 downto 0));-- multiplication product
end Convolutor;

architecture Behavioral of Convolutor is

component Accumulator is
    Port ( M_Clock : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (7 downto 0); -- ReadDataA
           B : in STD_LOGIC_VECTOR (7 downto 0); -- ReadDataB
           --PartSum : in STD_LOGIC_VECTOR (23 downto 0);
           PBConv : in STD_LOGIC;
           PBClearSUM : in STD_LOGIC;
           
           SUM : out STD_LOGIC_VECTOR (23 downto 0);
           Product : out STD_LOGIC_VECTOR (15 downto 0));
end component Accumulator;

component SUMRegister is    -- 24-bit register
    Port ( M_Clock : in STD_LOGIC;
           SUM : in STD_LOGIC_VECTOR (23 downto 0);
           
           PartSum : out STD_LOGIC_VECTOR(23 downto 0));
end component SUMRegister;

signal Multtemp : STD_LOGIC_VECTOR (15 downto 0); -- product temp
signal SUMtemp : STD_LOGIC_VECTOR (23 downto 0);
signal RegSUM : STD_LOGIC_VECTOR (23 downto 0) := (OTHERS => '0'); -- partial sum

begin

Acc: Accumulator port map(M_Clock, W, X, PBConv, PBClearSUM, SUMtemp, Multtemp);
Reg: SUMRegister port map(M_Clock, SUMtemp, RegSUM);

MultRes <= Multtemp;
SUM <= RegSUM;

end Behavioral;
