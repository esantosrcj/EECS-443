

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.mem_utils.all,std.textio.all;

entity Conv_sim is  -- Count_sim is the entity name of the simulation 
end Conv_sim;       -- note that it does not contain any input/output port   

architecture Behavioral of Conv_sim is

component TopLevel is
    Port (--SW 	        : in  STD_LOGIC_VECTOR (15 downto 0);
          --BTN         : in  STD_LOGIC_VECTOR (4 downto 0);
          Clock_top      : in STD_LOGIC;
          PB_top         : in STD_LOGIC_VECTOR (4 downto 0);
          SW_top         : in STD_LOGIC_VECTOR (15 downto 0);
          
          LED_top        : out STD_LOGIC_VECTOR (15 downto 0));
end component TopLevel;

signal Clock : STD_LOGIC;
signal SW : STD_LOGIC_VECTOR (15 downto 0);
signal PB : STD_LOGIC_VECTOR (4 downto 0);
signal LED : STD_LOGIC_VECTOR (15 downto 0);

begin

--C1: TopLevel port map(Clock, PB, SW, LED);--, DataA, DataB);
process
begin

--PB(PBConv_top, PBClearSUM_top, PBWrite_top, PBRead_top, PBClearReg_top)
--PB(Center, Left, Up, Down, Right)
    SW(15 downto 11) <= "00001";-- WriteAddr
    SW(7 downto 0) <= "00001111";--WriteData
    PB <= "00100";  -- Write
    wait for 10 ns;

    SW(15 downto 11) <= "00001";
    SW(1 downto 0) <= "00";-- SEL
    PB <= "00010";  -- Read
    wait for 10ns;
    
    SW(15 downto 11) <= "10000";-- WriteAddr
    SW(7 downto 0) <= "00000011";--WriteData
    PB <= "00100";  -- Write
    wait for 10 ns;
    
    SW(15 downto 11) <= "10000";
    SW(1 downto 0) <= "00";-- SEL
    PB <= "00010";  -- Read
    wait for 10ns;
    
    SW(15 downto 11) <= "00001";-- AddrA
    SW(10 downto 6) <= "10000"; -- AddrB
    PB <= "00000";
    wait for 10ns;
    
    PB <= "10000"; -- Convolution
    wait for 10ns;
    
    SW(1 downto 0) <= "10"; -- MultRes
    PB <= "00010"; -- Read
    wait for 10ns;
    
    SW(1 downto 0) <= "01"; -- SUM
    PB <= "00010"; -- Read
    wait;
    
end process;

ClkGen: process  -- This is the process that generates clock signal 
begin  -- clock frequency is 2 ns per cycle 
    Clock <= '1';
    wait for 2 ns;

    Clock <= '0';
    wait for 2 ns;
    
end process;
end Behavioral;
