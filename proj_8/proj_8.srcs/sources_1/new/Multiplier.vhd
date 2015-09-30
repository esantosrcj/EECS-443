----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2015 03:06:13 PM
-- Design Name: 
-- Module Name: Multiplier - Behavioral
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
use work.mem_utils.all, std.textio.all;
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multiplier is
    Port ( M_Clock : STD_LOGIC;
           W : in STD_LOGIC_VECTOR (7 downto 0); -- ReadDataA
           X : in STD_LOGIC_VECTOR (7 downto 0); -- ReadDataB
           
           Product : out STD_LOGIC_VECTOR (15 downto 0));
end Multiplier;

architecture Behavioral of Multiplier is

begin
process(M_Clock, W, X)
--variable temp : STD_LOGIC_VECTOR (15 downto 0) := (OTHERS => '0');
--variable add : STD_LOGIC_VECTOR (8 downto 0);

begin
--    if rising_edge(M_Clock) then
--        temp := X"00" & X;  -- X is ReadDataB so temp = "0000 0000 ReadDataB"
--        for i in 0 to 7 loop
--            if temp(0) = '1' then
--                add := ('0' & W) + ('0' & temp(15 downto 8));
--                temp := add & temp(7 downto 1);
--            else
--                temp := '0' & temp(15 downto 1);
--            end if;
--        end loop;
--    end if;
    if (rising_edge(M_Clock)) then
        Product <= W*X;
    end if;

end process;
end Behavioral;
