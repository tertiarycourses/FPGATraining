----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 07/15/2018 09:07:31 PM
-- Design Name:
-- Module Name: tb_counter - Behavioral
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
use STD.textio.all;
use ieee.std_logic_textio.all;


entity tb_counter_up_down is
--  Port ( );
end tb_counter_up_down;

architecture Behavioral of tb_counter_up_down is

-- component declaration for unit under test (UUT)
component counter_up_down
    Port ( resetn   	: in STD_LOGIC;
           clock    	: in STD_LOGIC;
           i_enable 	: in STD_LOGIC;
           i_up_dwn  : in STD_LOGIC;
           o_count  	: out STD_LOGIC_VECTOR (3 downto 0));
end component;

--inputs
signal tb_resetn    : std_logic:='0';
signal tb_clock     : std_logic:='0';
signal tb_i_enable  : std_logic:='0';
signal tb_i_up_dwn  : std_logic:='1';

-- output
signal tb_o_count   : std_logic_vector(3 downto 0);

-- clock period defination
constant clock_peroid : time := 10 ns;


begin

-- instantiate the unit under test (UUT)
counter_inst : counter_up_down
port map
    (
      resetn    => tb_resetn,
      clock     => tb_clock,
      i_enable  => tb_i_enable,
      i_up_dwn  => tb_i_up_dwn,
      o_count   => tb_o_count

    );

-- resetn process defination
resetn_process : process
begin
  wait for 20 ns ;
  tb_resetn <= '1';
  wait;
end process;

-- clock process defination
clock_process : process     --- infinite loop , process don't have any wait state
begin
    tb_clock <= '0';
    wait for clock_peroid/2;
    tb_clock <= not tb_clock;
    wait for clock_peroid/2;
end process;

-- i_enable defination
i_enable : process
begin
    wait for 50 ns;
    tb_i_enable <= '1';
    wait for 500 ns;
    tb_i_enable <= '0';
    wait for 200 ns ;
    tb_i_enable <= '1';
    wait;
 end process;


 -- i_up_dwn defination
  i_up_dwn : process
  begin
    wait for 200 ns;
    tb_i_up_dwn <= '0';
    wait for 500 ns ;
    tb_i_up_dwn <= '1';
 end process i_up_dwn;

 -- write process
write_file:process
-- textio declaration
file file_results : text;            -- file of string
variable outline : LINE;             -- string
begin
-- open file in write mode
--file_open(file_results, "output_results.txt", write_mode);  //counter\counter.sim\sim_1\behav\xsim
file_open(file_results, "D:\GR\Personal\counter\output_results.txt",write_mode);
 for i in 1 to 50 loop
  	wait until falling_edge(tb_clock);
  	       write(outline,tb_o_count);                -- Line Buffer
  	     	 writeline(file_results,outline);
  end loop;

    file_close(file_results);               -- close the file
    wait for 1000 ns;
    assert false
           report "simulation finish successfully"
           severity failure;               -- severity failure will cause the simulation to stop


 end process write_file;





 end Behavioral;
