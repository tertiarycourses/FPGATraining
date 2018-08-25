library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_std.all;

entity tb_ram is
end entity tb_ram;

architecture arch of tb_ram is


  signal tb_dataout 	      : std_logic_vector(7 downto 0);
  signal tb_we 				: std_logic;
  signal tb_clock 			: std_logic;
  signal tb_count_address  : std_logic_vector(9 downto 0):= (others => '0');
  signal tb_count_data     : std_logic_vector(7 downto 0):= (others => '0');
  signal tb_read_address   : std_logic_vector(9 downto 0) := (others => '0');
  constant clock_peroid    : time := 10 ns;
  constant tcq_delay       : time := 1.5 ns;

begin

  UUT_memory_ram: entity work.memory_ram(RTL)
  port map (
    clock   		=> tb_clock,
    we      		=> tb_we,
    wr_address 	=> tb_count_address,
    read_address 	=> tb_read_address,
    datain 	 		=> tb_count_data,
    dataout 		=> tb_dataout
  );

  clock_process : process
  begin
      tb_clock <= '0';
      wait for clock_peroid/2;
      tb_clock <= not tb_clock;
      wait for clock_peroid/2;
  end process;

  tb_we <= '1';

address: process (tb_clock)
begin
	if rising_edge(tb_clock) then
	tb_count_address <= std_logic_vector(unsigned(tb_count_address) + 1) after tcq_delay;
  else
   tb_count_address <= tb_count_address;
  end if;
end process address;


data: process (tb_clock)
begin
	if rising_edge(tb_clock) then
	tb_count_data <= std_logic_vector(unsigned(tb_count_data) + 1) after tcq_delay ;
  else
   tb_count_data <= tb_count_data;
  end if;
end process data;


read_address: process (tb_clock)
begin
	if rising_edge(tb_clock) then
		if tb_count_address > "0000001111" then
			tb_read_address <= std_logic_vector(unsigned(tb_read_address) + 1) after tcq_delay;
      else
         tb_read_address <= tb_read_address;
  		end if;
   end if;
end process read_address;


end architecture arch;
