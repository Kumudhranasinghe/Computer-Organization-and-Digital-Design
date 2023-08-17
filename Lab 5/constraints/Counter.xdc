## Switches
set_property PACKAGE_PIN V17 [get_ports {Dir}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Dir}]
    
##Buttons
set_property PACKAGE_PIN U17 [get_ports {Res}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Res}]
    
## Clock signal
set_property PACKAGE_PIN W5 [get_ports {Clk}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Clk}]
    create_clock -add -name sys_clk_pin -period 1.00 -waveform {0 5} [get_ports {Clk}]    
    
## LEDs
set_property PACKAGE_PIN U16 [get_ports {Q(0)}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Q(0)}]
set_property PACKAGE_PIN E19 [get_ports {Q(1)}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Q(1)}]
set_property PACKAGE_PIN U19 [get_ports {Q(2)}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Q(2)}]    
