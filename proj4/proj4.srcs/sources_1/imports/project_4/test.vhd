----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2015 01:22:07 PM
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
use work.mem_utils.all,std.textio.all;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test is
end test;

architecture Behavioral of test is

signal clk_test, write_test : std_logic;-- := '0'; 
signal readAddA_test, readAddB_test, writeAdd_test : nybble; 
signal readDataA_test, readDataB_test, writeData_test : byte;-- := (others=>'0');

component RegFile is 
Port(M_Clock: in std_logic;
     ReadAddrA: in  nybble;
     ReadDataA: out byte;
     ReadAddrB: in   nybble;
     ReadDataB: out byte;
     WriteEnable: in std_logic;
     WriteAddr: in   nybble;
     WriteData: in byte);
end component;

begin

--simmem: process 
--begin 

--wait for 5 ns; 
--end process; 
map1: regfile port map (M_Clock => clk_test, 
         ReadAddrA => readAddA_test,
         ReadDataA => readDataA_test,
         ReadAddrB => readAddB_test,
         ReadDataB => readDataB_test, 
         WriteEnable => write_test, 
         WriteAddr => writeAdd_test,
         WriteData => writeData_test);
      
clkgen: process 
begin 
wait for 1 ns; clk_test <= '1';
wait for 1 ns; clk_test <= '0';
end process; 

sim1: process 
begin 

readAddA_test <= X"0"; 
readAddB_test <= X"0";

write_test <= '1';

wait for 5 ns; 

for i in 0 to 15 loop
    --OME_VECTOR <= conv_std_logic_vector(SOME_INTEGER, 4);
    writeAdd_test <= conv_std_logic_vector(i, 4);--writeAdd_test'length);
    writeData_test <= conv_std_logic_vector(i, 8);--writeData_test'length);
    wait for 0.5 ns; --ps; 
end loop; 

wait for 5 ns; 

readAddA_test <= X"4"; 
readAddB_test <= X"E"; 

wait for 5 ns; 

wait ; 

end process; 
end Behavioral;
