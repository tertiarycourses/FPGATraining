----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 07/19/2018 02:33:52 PM
-- Design Name:
-- Module Name: seqence_det - Behavioral
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


entity sequence_det is
    Port ( clock           : in STD_LOGIC;
           resetn          : in STD_LOGIC;
           data_in         : in STD_LOGIC;
           output_valid    : out STD_LOGIC);
end sequence_det;

architecture rtl of sequence_det is

type state_type is (S0,S1,S2,S3);             --Defines the type for states in the state machine
signal state : state_type := S0;              --Declare the signal with the corresponding state type.

begin

process(clock)
begin
    if( resetn = '0' ) then     --resets state and output signal when reset is asserted.
        output_valid <= '0';
        state <= S0;
    elsif ( rising_edge(clock) ) then   --calculates the next state based on current state and input bit.
        case state is
            when S0 =>   --when the current state is S0.
                output_valid <= '0';
                if ( data_in = '0' ) then
                    state <= S0;
                else
                    state <= S1;
                end if;
            when S1 =>   --when the current state is S1.
                if ( data_in = '0' ) then
                    state <= S2;
                else
                    state <= S1;
                end if;
            when S2 =>   --when the current state is S2.
                if ( data_in = '0' ) then
                    state <= S0;
                else
                    state <= S3;
                end if;
            when S3 =>   --when the current state is S3.
                if ( data_in = '0' ) then
                    state <= S2;
                else
                    state <= S0;
                    output_valid <= '1';   --Output is asserted when the pattern "1011" is found in the sequence.
                end if;
            when others =>
                NULL;
        end case;
    end if;
end process;

end rtl;
