----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:      07/15/2018 08:38:09 PM
-- Design Name:      counter
-- Module Name:      counter - Behavioral
-- Project Name:     vhdl Training
-- Target Devices:   xilinx
-- Tool Versions:    v2017.4
-- Description:
--
-- Dependencies:     None
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;                                         -- support signed and unsigned


-- Entity declaration
entity counter is
    Port ( resetn 	: in  std_logic;                             -- active low reset
           clock 		: in  std_logic;                             -- system clock
           i_enable 	: in  std_logic;                             -- input enable
           o_count 	: out std_logic_vector (3 downto 0));        -- output data
end counter;

--Architecture declaration
architecture rtl of counter is

-- signal declaratoiom
signal s_count : std_logic_vector(3 downto 0);

begin
 counter : process(resetn,clock)                                     -- sensitivity list
  begin
    if( resetn = '0') then                                            -- Asynchronous reset
        s_count <= (others =>'0');
    elsif rising_edge (clock) then
      if ( i_enable = '1' ) then
      	  s_count    <=  std_logic_vector(unsigned(s_count) + 1);   -- type conversion
      else
           s_count    <= s_count;
      end if; -- i_enable
    end if; -- resetn
  end process counter;

    o_count <= s_count;

 end rtl;
