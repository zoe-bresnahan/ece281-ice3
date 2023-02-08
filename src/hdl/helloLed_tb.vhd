library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity helloLed_tb is
--  Port ( );
end helloLed_tb;

architecture test_bench of helloLed_tb is
    -- declare the component of your top-level design unit under test (UUT) (looks very similar to entity declaration)
    component helloLed is
    port(
	   i_sw0 : in std_logic;
	   o_ld0 : out std_logic
    );
    end component;

    -- signals are
    signal w_sw0 : std_logic := '0';
    signal w_ld0 : std_logic := '0';

begin
    -- PORT MAPS ----------------------------------------
	-- map ports for any component instances (port mapping is like wiring hardware)
    helloLed_inst : helloLed port map (
			i_sw0 => w_sw0,
			o_ld0 => w_ld0
        );
	-----------------------------------------------------

	-- PROCESSES ----------------------------------------
	-- Test Plan Process --------------------------------
	-- Implement the test plan here.  Body of process is continuous from time = 0
	test_process : process
        begin
            -- Set the switch to ON and wait for 1 ns
        w_sw0 <= '1';
        wait for 1 ns;
        -- Check that the LED is ON
        assert w_ld0 = '1' report "LED should be ON when switch is ON" severity failure;

        -- Set the switch to OFF and wait for 1 ns
        w_sw0 <= '0';
        wait for 1 ns;
        -- Check that the LED is OFF
        assert w_ld0 = '0' report "LED should be OFF when switch is OFF" severity failure;

        -- Set the switch to ON again and wait for 1 ns
        w_sw0 <= '1';
        wait for 1 ns;
        -- Check that the LED is ON
        assert w_ld0 = '1' report "LED should be ON when switch is ON" severity failure;

        wait; -- wait forever
	end process;
	-----------------------------------------------------

end test_bench;
