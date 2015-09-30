---- Memory Support Utilities -------------------------------------------------
--
-- Author: Perry Alexander
-- Version: 1.0
-- Date: 2/18/01
-- Uses: mem_utils
--
-- Objective: Define some primitive memory types
-- 
-- Usage:
-- Pretty standard stuff here...
--
-- Change Log:
-- 
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

package mem_utils is
  -- A word is 16 bits
  subtype word is std_logic_vector(15 downto 0);
  -- A byte is 8 bits
  subtype byte is std_logic_vector(7 downto 0);
  -- A nybble is 4 bits
  subtype nybble is std_logic_vector(4 downto 0);
end package mem_utils;
