library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity helloLed is
  port(
    -- inputs
    i_sw0 : in std_logic; -- the rightmost switch

    -- outputs
    o_ld0 : out std_logic -- the rightmost LED
    );
end helloLed;

architecture Behavioral of helloLed is

begin

    -- directly map the led to the switch
	o_ld0 <= i_sw0;

end Behavioral;
