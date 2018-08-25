Library ieee;
use ieee.std_logic_1164.all;

-- Entity Declaration
entity combi_logic is
   port(
        a : in    std_logic;
        b : in    std_logic;
        x : out   std_logic;
        y : out   std_logic;
        z : out   std_logic
      );
end combi_logic;

-- Architecture Declaration
architecture RTL of combi_logic is
begin

   x <= a  and b;
   
   y <= a  or  b;
   
   z  <= a  xor b;
  

end RTL;
