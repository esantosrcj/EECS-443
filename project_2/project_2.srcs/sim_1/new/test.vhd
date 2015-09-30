----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2015 05:07:47 PM
-- Design Name: 
-- Module Name: test - Behavioral
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

entity test is
  --  Port ( );
end test;

architecture Behavioral of test is

component Count32 is
    Port ( M_Clock : in STD_LOGIC;
           CountValue : out STD_LOGIC_VECTOR (32 downto 1));
end component Count32;

component EventGen is
    Port ( CountValue : in STD_LOGIC_VECTOR (32 downto 1);
           Events : out STD_LOGIC_VECTOR (32 downto 1));
end component EventGen;

signal CLock_test : std_logic;
signal CValue_test : std_logic_vector (32 downto 1);

--signal EventsCValue_test : std_logic_vector (32 downto 1);
signal Events_test : std_logic_vector (32 downto 1);

begin
map1: Count32 port map (M_Clock => CLock_test, CountValue => CValue_test);

map2: EventGen port map (CountValue => CValue_test, Events => Events_test);

clkgen: process 
begin 
wait for 1 ns; CLock_test <= '1';
wait for 1 ns; CLock_test <= '0';
end process;

--clkgen2: process 
--begin 
--wait for 1 ns; CLock_test <= '1';
--wait for 1 ns; CLock_test <= '0';
--end process; 

end Behavioral;
