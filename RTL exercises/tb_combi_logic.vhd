Library ieee;
use ieee.std_logic_1164.all;

-- Entity Declaration
entity tb_combi_logic is
end tb_combi_logic;

-- Architecture Declaration
architecture test_combi_logic of tb_combi_logic is

constant TIME_DELTA : time := 10 ns;
signal tb_a,tb_b,tb_x,tb_y,tb_z : std_logic;

begin

--Instantiate DUT
UUT_combi_logic : entity work.combi_logic(RTL)
port map
    (
        a  =>  tb_a,
        b  =>  tb_b,
        x  =>  tb_x,
        y  =>  tb_y,
        z  =>  tb_z
     );

-- Procedure declaration
simulation : process

   procedure input_values ( constant in1 : in std_logic;
                            constant in2 : in std_logic) is
   begin
      -- Assign values to circuit input
      tb_a <= in1;
      tb_b <= in2;

      wait for TIME_DELTA;
   end procedure input_values;


begin   -- process
  -- calling procedure
 input_values( '0','0');
 input_values( '0','1');
 input_values( '1','0');
 input_values( '1','1');

 wait ;   -- Make the process wait indefinately.
end process simulation;

end test_combi_logic;
