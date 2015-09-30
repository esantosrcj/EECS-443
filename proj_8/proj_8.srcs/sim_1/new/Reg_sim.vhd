----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2015 01:38:02 PM
-- Design Name: 
-- Module Name: Reg_sim - Behavioral
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

entity Reg_sim is
end Reg_sim;

architecture Behavioral of Reg_sim is

component RegFile is
    Port ( M_Clock : in STD_LOGIC;
           WriteEnable : in STD_LOGIC;-- PBWrite_top
           PBClearReg : in STD_LOGIC;
           WriteAddr : in STD_LOGIC_VECTOR (4 downto 0);--SW(15:11)
           WriteData : in STD_LOGIC_VECTOR (7 downto 0);--SW(7:0)
           ReadAddrA : in STD_LOGIC_VECTOR (4 downto 0);--SW(15:11)
           ReadAddrB : in STD_LOGIC_VECTOR (4 downto 0);--SW(10:6)
           
           ReadDataA : out STD_LOGIC_VECTOR (7 downto 0);--W(i)
           ReadDataB : out STD_LOGIC_VECTOR (7 downto 0));--X(i)
end component RegFile;

component Multiplexer is
    Port ( DataA : in STD_LOGIC_VECTOR (7 downto 0);-- 8-bits
           SUM : in STD_LOGIC_VECTOR (23 downto 0);     -- 24-bits
           MultRes : in STD_LOGIC_VECTOR (15 downto 0); -- 16-bits
           SEL : in STD_LOGIC_VECTOR (1 downto 0);      -- 2-bits
           PBRead : in STD_LOGIC;
           
           LEDout : out STD_LOGIC_VECTOR (15 downto 0));-- 16-bits
end component Multiplexer;

signal Clock, WriteEnable, PBClearReg : STD_LOGIC;
signal WriteAddr : STD_LOGIC_VECTOR (4 downto 0);
signal WriteData : STD_LOGIC_VECTOR (7 downto 0);

signal AddrA : STD_LOGIC_VECTOR (4 downto 0);
signal DataA : STD_LOGIC_VECTOR (7 downto 0);
signal AddrB : STD_LOGIC_VECTOR (4 downto 0);
signal DataB : STD_LOGIC_VECTOR (7 downto 0);

--signal DataA : STD_LOGIC_VECTOR (7 downto 0);-- 8-bits
signal SUM :  STD_LOGIC_VECTOR (23 downto 0);     -- 24-bits
signal MultRes : STD_LOGIC_VECTOR (15 downto 0); -- 16-bits
signal SEL : STD_LOGIC_VECTOR (1 downto 0);      -- 2-bits
signal PBRead : STD_LOGIC;

signal LEDout : STD_LOGIC_VECTOR (15 downto 0);-- 16-bits

begin

Reg: RegFile port map(Clock, WriteEnable, PBClearReg, WriteAddr, WriteData, AddrA, AddrB, DataA, DataB);
MUX: Multiplexer port map(DataA, SUM, MultRes, SEL, PBRead, LEDout);

process
begin

    WriteAddr <= "00001";
    WriteData <= "00001111"; -- 15
    WriteEnable <= '1';
    PBClearReg <= '0';
    SUM <= X"000008"; -- 8
    MultRes <= X"000A"; -- 10
    PBRead <= '0';
    wait for 10ns;
    
    AddrA <= "00001"; --AddrA
    SEL <= "00"; -- DataA
    PBRead <= '1';
    wait for 10ns;
    
    WriteAddr <= "01000";
    WriteData <= "00000011"; -- 3
    PBRead <= '0';
    wait for 10ns;
    
    AddrB <= "01000"; --AddrB
    wait for 10ns;
   
    WriteAddr <= "00010";
    WriteData <= "00000010"; -- 2
    wait for 10ns;

    AddrA <= "00010"; --AddrA
    SEL <= "00"; -- DataA
    PBRead <= '1';
    wait for 10ns;
    
    WriteAddr <= "00011";
    WriteData <= "00010000"; -- 16
    SEL <= "01"; -- SUM
    wait for 10ns;
    
    AddrB <= "00011"; --AddrB
    SEL <= "10";
    wait for 10ns;
    
    WriteEnable <= '0';
    PBClearReg <= '1';
    wait for 20ns;
    
--    DataA <= "00001111"; -- 15
--    SUM <= X"000008"; -- 8
--    MultRes <= X"000A"; -- 10
--    PBRead <= '0';
--    wait for 10ns;
    
--    SEL <= "00"; -- DataA
--    PBRead <= '1';
--    wait for 10ns;
    
--    PBRead <= '0';
--    wait for 10ns;
    
--    SEL <= "01"; -- SUM
--    PBRead <= '1';
--    wait for 10ns;
    
--    PBRead <= '0';
--    wait for 10ns;
    
--    SEL <= "10"; -- MultRes
--    PBRead <= '1';
--    wait;

end process;

ClkGen: process  -- This is the process that generates clock signal 
begin  -- clock frequency is 2 ns per cycle 
    Clock <= '1';
    wait for 2 ns;

    Clock <= '0';
    wait for 2 ns;
    
end process;
end Behavioral;
