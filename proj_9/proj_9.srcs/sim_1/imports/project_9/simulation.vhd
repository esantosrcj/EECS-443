

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.MEM_UTILS.ALL, STD.TEXTIO.ALL;

entity Count_sim is  -- Count_sim is the entity name of the simulation 
end Count_sim;       -- note that it does not contain any input/output port   

architecture Behavioral of Count_sim is

component Counter is
    Port ( Clk : in STD_LOGIC;
           Clear : in STD_LOGIC;
           Load : in STD_LOGIC;
           Up : in STD_LOGIC;
           LoadAddr : in STD_LOGIC_VECTOR (4 downto 0);
           Enable : in STD_LOGIC;
           
           Addr : out STD_LOGIC_VECTOR (4 downto 0));
end component Counter;

component ReadOnlyMem is
    Port ( Clk : in STD_LOGIC;
           Enable : in STD_LOGIC;
           ReadAddr : in STD_LOGIC_VECTOR (4 downto 0);
           
           ReadData : out STD_LOGIC_VECTOR (31 downto 0));
end component ReadOnlyMem;

-- declare all signals that will be connected to components --
signal M_Clk, En, Up, Clr, Ld, En_Reg : STD_LOGIC;

-- values of these signals will be displayed in simulation --
signal LdAddr, Addr : STD_LOGIC_VECTOR (4 downto 0); 
signal Rdat : STD_LOGIC_VECTOR (31 downto 0);

begin

-- mapping components to the simulation signals --
C1: Counter port map(M_Clk, Clr, Ld, Up, LdAddr, En, Addr);
C2: ReadOnlyMem port map(M_Clk, En_Reg, Addr, Rdat);

process
begin
    En <= '0'; -- disable enable of counter initially
    En_Reg <= '0';  
    Up <= '0'; -- disable UP signal of counter
    Clr <= '0';  -- disable Clear signal of counter 
    Ld <= '0';  -- disable load signal of counter 
    LdAddr <= "01000";  -- "8" fix the loading address for counter 
    wait for 10 ns;  -- wait for some time 

    En <= '1';   -- set both EN and UP of counter to active
    En_Reg <= '1';
    Up <= '1';   -- we should expect the output Cnt to start incrementing at clock rising edge
    wait for 50 ns;

    Up <= '0';
    wait for 100ns;
-- add a test to verify the load function of counter 
    --Ld <= '1';
    --wait for 100 ns;
-- add at least two more tests to verify at least two more functionalities of either counter or ROM  
    Clr <= '1';
    wait for 20 ns;

end process;

ClkGen: process  -- This is the process that generates clock signal 
begin  -- clock frequency is 2 ns per cycle 
    M_Clk <= '1';
    wait for 4 ns;

    M_Clk <= '0';
    wait for 4 ns;
    
end process;
end Behavioral;
