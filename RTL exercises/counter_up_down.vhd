library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;             -- support signed and unsigned no std_logic vector


-- Entity declaration
entity counter_up_down is
    Port ( resetn 	: in STD_LOGIC;
           clock 		: in STD_LOGIC;
           i_enable 	: in STD_LOGIC;
           i_up_dwn  : in STD_LOGIC;
           o_count 	: out STD_LOGIC_VECTOR (3 downto 0));
end counter_up_down;

--Architecture declaration
architecture rtl of counter_up_down is
signal s_count : std_logic_vector(3 downto 0);

begin
 counter : process(resetn,clock)
  begin
    if( resetn = '0') then
        s_count <= (others =>'0');
    elsif rising_edge (clock) then
      if ( i_enable = '1' ) then
      	if ( i_up_dwn = '1') then
        		s_count    <=  std_logic_vector(unsigned(s_count) + 1);
         else
            s_count    <=  std_logic_vector(unsigned(s_count) - 1);
         end if; -- i_up_dwn
      else
        s_count    <= s_count;
      end if; -- i_enable
    end if; -- resetn
  end process counter;

    o_count <= s_count;

 end rtl;

