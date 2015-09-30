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

---- Convolutor ----
component Convolutor is
    Port ( M_Clock : in STD_LOGIC;
           W : in STD_LOGIC_VECTOR (7 downto 0); -- ReadDataA
           X : in STD_LOGIC_VECTOR (7 downto 0); -- ReadDataB
           PBConv : in STD_LOGIC;   -- convolution push button
           PBClearSUM : in STD_LOGIC;    -- clear push button
           
           SUM : out STD_LOGIC_VECTOR (23 downto 0);    -- SUM
           MultRes : out STD_LOGIC_VECTOR (15 downto 0));-- multiplication product
           --PartTest : out STD_LOGIC_VECTOR (23 downto 0));
end component Convolutor;

signal Clock : STD_LOGIC;
signal A : STD_LOGIC_VECTOR (7 downto 0); -- ReadDataA
signal B : STD_LOGIC_VECTOR (7 downto 0); -- ReadDataB
signal Conbutton : STD_LOGIC;   -- convolution push button
signal ClrSUMbutton : STD_LOGIC;    -- clear push button
           
signal SUM : STD_LOGIC_VECTOR (23 downto 0);    -- SUM
signal Product : STD_LOGIC_VECTOR (15 downto 0);-- multiplication product
--signal PartTest : STD_LOGIC_VECTOR (23 downto 0);

begin

Con: Convolutor port map(Clock, A, B, Conbutton, ClrSUMbutton, SUM, Product);

process
begin

---- Convolutor ----
    --wait for 10ns;
    A <= "00001111";
    B <= "00000001";
    
    Conbutton <= '0';
    ClrSUMbutton <= '0';
    wait for 6ns;
    
    Conbutton <= '1';
    ClrSUMbutton <= '0';
    wait for 6ns;
    
    Conbutton <= '0';
    ClrSUMbutton <= '1';
    wait for 6ns;
    
    Conbutton <= '1';
    ClrSUMbutton <= '0';
    wait for 12ns;

    A <= "00000011";
    B <= "00000011";
    Conbutton <= '0';
    ClrSUMbutton <= '0';  
    wait for 12ns;
    
    Conbutton <= '1';
    ClrSUMbutton <= '0';
    wait for 12ns;
    
    wait for 12ns;
    
    wait;
--    Conbutton <= '0';
--    ClrSUMbutton <= '1';
--    wait for 10ns;
    
--    A <= "00001000";
--    B <= "00001111";
--    Conbutton <= '0';
--    ClrSUMbutton <= '0';
--    wait for 5ns;
    
--    Conbutton <= '1';
--    ClrSUMbutton <= '0';
--    wait;
    
end process;

ClkGen: process
begin
    
    Clock <= '1';
    wait for  2ns;
    
    Clock <= '0';
    wait for  2ns;

end process;
end Behavioral;
