## This file is a general .xdc for the Nexys4 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
#Bank = 35, Pin name = IO_L12P_T1_MRCC_35,					Sch name = CLK100MHZ
set_property PACKAGE_PIN E3 [get_ports CLK]							
	set_property IOSTANDARD LVCMOS33 [get_ports CLK]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports CLK]
 

## LEDs
#Bank = 34, Pin name = IO_L22N_T3_34,						Sch name = LED7
set_property PACKAGE_PIN U6 [get_ports {LEDtop[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDtop[0]}]
#Bank = 34, Pin name = IO_L10N_T1_34,						Sch name = LED8
set_property PACKAGE_PIN V4 [get_ports {LEDtop[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDtop[1]}]
#Bank = 34, Pin name = IO_L8N_T1_34,						Sch name = LED9
set_property PACKAGE_PIN U3 [get_ports {LEDtop[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDtop[2]}]
#Bank = 34, Pin name = IO_L7N_T1_34,						Sch name = LED10
set_property PACKAGE_PIN V1 [get_ports {LEDtop[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDtop[3]}]
#Bank = 34, Pin name = IO_L17P_T2_34,						Sch name = LED11
set_property PACKAGE_PIN R1 [get_ports {LEDtop[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDtop[4]}]
#Bank = 34, Pin name = IO_L13N_T2_MRCC_34,					Sch name = LED12
set_property PACKAGE_PIN P5 [get_ports {LEDtop[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDtop[5]}]
#Bank = 34, Pin name = IO_L7P_T1_34,						Sch name = LED13
set_property PACKAGE_PIN U1 [get_ports {LEDtop[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDtop[6]}]
#Bank = 34, Pin name = IO_L15N_T2_DQS_34,					Sch name = LED14
set_property PACKAGE_PIN R2 [get_ports {LEDtop[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDtop[7]}]
#Bank = 34, Pin name = IO_L15P_T2_DQS_34,					Sch name = LED15
set_property PACKAGE_PIN P2 [get_ports {LEDtop[8]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDtop[8]}]