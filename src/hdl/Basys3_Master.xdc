## This file is a minimal .xdc for the Basys3 rev B board
## It is setup for the helloLed demo

## Switches
set_property PACKAGE_PIN V17 [get_ports {i_sw0}]
	set_property IOSTANDARD LVCMOS33 [get_ports {i_sw0}]

## LEDs
set_property PACKAGE_PIN U16 [get_ports {o_ld0}]
	set_property IOSTANDARD LVCMOS33 [get_ports {o_ld0}]
