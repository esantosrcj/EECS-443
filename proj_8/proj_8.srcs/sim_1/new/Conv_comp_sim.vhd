----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2015 04:25:23 PM
-- Design Name: 
-- Module Name: Convolution_component_sim - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Conv_comp_sim is
end Conv_comp_sim;

architecture Behavioral of Conv_comp_sim is

component Convolutor is
    Port ( M_Clock : STD_LOGIC;
           W : in STD_LOGIC_VECTOR (7 downto 0); -- ReadDataA
           X : in STD_LOGIC_VECTOR (7 downto 0); -- ReadDataB
           PBConv : in STD_LOGIC;   -- convolution push button
           Clear : in STD_LOGIC;    -- clear push button
           
           SUM : out STD_LOGIC_VECTOR (23 downto 0);    -- SUM
           MultRes : out STD_LOGIC_VECTOR (15 downto 0));-- multiplication product
end component Convolutor;

begin


end Behavioral;
