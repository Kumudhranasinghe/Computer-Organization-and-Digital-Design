## Clock signal
set_property PACKAGE_PIN W5 [get_ports {Clk}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Clk}]
    create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {Clk}]
    
## Switches
set_property PACKAGE_PIN V17 [get_ports {D(0)}]
    set_property IOSTANDARD LVCMOS33 [get_ports {D(0)}]
set_property PACKAGE_PIN V16 [get_ports {D(1)}]
    set_property IOSTANDARD LVCMOS33 [get_ports {D(1)}]
set_property PACKAGE_PIN W16 [get_ports {D(2)}]
    set_property IOSTANDARD LVCMOS33 [get_ports {D(2)}]
set_property PACKAGE_PIN W17 [get_ports {D(3)}]
    set_property IOSTANDARD LVCMOS33 [get_ports {D(3)}]   
set_property PACKAGE_PIN R2 [get_ports {En}]
    set_property IOSTANDARD LVCMOS33 [get_ports {En}]
    
## LEDs
set_property PACKAGE_PIN U16 [get_ports {Q(0)}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Q(0)}]
set_property PACKAGE_PIN E19 [get_ports {Q(1)}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Q(1)}]
set_property PACKAGE_PIN U19 [get_ports {Q(2)}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Q(2)}]
set_property PACKAGE_PIN V19 [get_ports {Q(3)}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Q(3)}]
