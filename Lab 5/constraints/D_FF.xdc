## Switches
set_property PACKAGE_PIN V17 [get_ports {D}]
    set_property IOSTANDARD LVCMOS33 [get_ports {D}]
set_property PACKAGE_PIN V16 [get_ports {Res}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Res}]
    
## Clock signal
set_property PACKAGE_PIN W5 [get_ports {Clk}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Clk}]
    create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {Clk}]
    
## LEDs
set_property PACKAGE_PIN U16 [get_ports {Q}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Q}]
set_property PACKAGE_PIN E19 [get_ports {Qbar}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Qbar}]
