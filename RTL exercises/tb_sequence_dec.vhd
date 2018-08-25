----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 07/19/2018 02:48:27 PM
-- Design Name:
-- Module Name: tb_sequence_dec - Behavioral
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


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity tb_sequence_det is
end tb_sequence_det;

architecture behavior of tb_sequence_det is

   signal  clock        : std_logic;
   signal  resetn       : std_logic := '0';
   signal  data_in      : std_logic;
   signal  output_valid : std_logic := '0';

   constant clk_period  : time := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
   uut: entity work.sequence_det PORT MAP (
          clock         =>  clock,
          resetn        =>  resetn,
          data_in       =>  data_in,
          output_valid  =>  output_valid
        );


--resetn process definations
active_low_resetn : process
begin
   wait for 8 ns;
    resetn <= '1';
    wait;
end process active_low_resetn;


   -- Clock process definitions
   clk_process :process
   begin
        clock <= '0';
        wait for clk_period/2;
        clock <= '1';
        wait for clk_period/2;
   end process;

   -- Stimulus process : Apply the bits in the sequence one by one.
   stim_proc: process
   begin
        data_in <= '1';             --1
      wait for clk_period;
        data_in <= '1';             --11
      wait for clk_period;
        data_in <= '0';             --110
      wait for clk_period;
        data_in <= '1';             --1101
      wait for clk_period;
        data_in <= '1';             --11011
      wait for clk_period;
        data_in <= '1';             --110111
      wait for clk_period;
        data_in <= '0';             --1101110
      wait for clk_period;
        data_in <= '1';             --11011101
      wait for clk_period;
        data_in <= '0';             --110111010
      wait for clk_period;
        data_in <= '1';             --1101110101
      wait for clk_period;
        data_in <= '0';             --11011101010
      wait for clk_period;
         data_in <= '1';            --110111010101
      wait for clk_period;
         data_in <= '0';            --1101110101010
      wait for clk_period;
         data_in <= '1';            --11011101010101
      wait for clk_period;
        data_in <= '1';             --110111010101011
      wait for clk_period;
         data_in <= '1';
      wait for clk_period;
         data_in <= '0';
      wait for clk_period;
         data_in <= '1';
      wait for clk_period;

      wait;
   end process;

END;
