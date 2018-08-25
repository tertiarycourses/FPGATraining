library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;

entity memory_ram is
  port (
    clock            : in  std_logic;
    we               : in  std_logic;
    wr_address       : in  std_logic_vector(9 downto 0);
    read_address     : in  std_logic_vector(9 downto 0);
    datain           : in  std_logic_vector(7 downto 0);
    dataout          : out std_logic_vector(7 downto 0)
  );
end entity memory_ram;

architecture RTL of memory_ram is
  -- memory 512*8 = 4096
   type ram_type is array (0 to (2**wr_address'length)-1) of std_logic_vector(datain'range);
   signal memory : ram_type;


begin

  RamProc: process(clock) is
-- write in memory(synchronous)
  begin
    if rising_edge(clock) then
      if( we = '1') then
        -- type conversion
        memory(to_integer(unsigned(wr_address))) <= datain;
      end if;
    end if;
  end process RamProc;
  -- read memory (Asynchronous)
  dataout <= memory(to_integer(unsigned(read_address)));

end architecture RTL;
