## This file is a general .xdc for the Nexys4 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
#Bank = 35, Pin name = IO_L12P_T1_MRCC_35,					Sch name = CLK100MHZ
set_property PACKAGE_PIN E3 [get_ports Clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports Clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports Clk]
 
## Switches
#Bank = 34, Pin name = IO_L21P_T3_DQS_34,					Sch name = SW0
set_property PACKAGE_PIN U9 [get_ports {SWtop[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {SWtop[0]}]
#Bank = 34, Pin name = IO_25_34,							Sch name = SW1
set_property PACKAGE_PIN U8 [get_ports {SWtop[1]}]	
	set_property IOSTANDARD LVCMOS33 [get_ports {SWtop[1]}]
#Bank = 34, Pin name = IO_L23P_T3_34,						Sch name = SW2
set_property PACKAGE_PIN R7 [get_ports {SWtop[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SWtop[2]}]
#Bank = 34, Pin name = IO_L19P_T3_34,						Sch name = SW3
set_property PACKAGE_PIN R6 [get_ports {SWtop[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SWtop[3]}]
#Bank = 34, Pin name = IO_L19N_T3_VREF_34,					Sch name = SW4
set_property PACKAGE_PIN R5 [get_ports {SWtop[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SWtop[4]}]
#Bank = 34, Pin name = IO_L20P_T3_34,						Sch name = SW5
set_property PACKAGE_PIN V7 [get_ports {SWtop[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SWtop[5]}]
#Bank = 34, Pin name = IO_L20N_T3_34,						Sch name = SW6
set_property PACKAGE_PIN V6 [get_ports {SWtop[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SWtop[6]}]
#Bank = 34, Pin name = IO_L10P_T1_34,						Sch name = SW7
set_property PACKAGE_PIN V5 [get_ports {SWtop[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SWtop[7]}]
#Bank = 34, Pin name = IO_L8P_T1-34,						Sch name = SW8
set_property PACKAGE_PIN U4 [get_ports {SWtop[8]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SWtop[8]}]
#Bank = 34, Pin name = IO_L9N_T1_DQS_34,					Sch name = SW9
set_property PACKAGE_PIN V2 [get_ports {SWtop[9]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SWtop[9]}]
#Bank = 34, Pin name = IO_L9P_T1_DQS_34,					Sch name = SW10
set_property PACKAGE_PIN U2 [get_ports {SWtop[10]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SWtop[10]}]
#Bank = 34, Pin name = IO_L11N_T1_MRCC_34,					Sch name = SW11
set_property PACKAGE_PIN T3 [get_ports {SWtop[11]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SWtop[11]}]
##Bank = 34, Pin name = IO_L17N_T2_34,						Sch name = SW12
#set_property PACKAGE_PIN T1 [get_ports {SW[12]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {SW[12]}]
#Bank = 34, Pin name = IO_L11P_T1_SRCC_34,					Sch name = SW13
set_property PACKAGE_PIN R3 [get_ports {Color[13]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Color[13]}]
#Bank = 34, Pin name = IO_L14N_T2_SRCC_34,					Sch name = SW14
set_property PACKAGE_PIN P3 [get_ports {Color[14]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Color[14]}]
#Bank = 34, Pin name = IO_L14P_T2_SRCC_34,					Sch name = SW15
set_property PACKAGE_PIN P4 [get_ports {Color[15]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Color[15]}]
 

#Bank = 34, Pin name = IO_L5P_T0_34,						Sch name = LED16_R
set_property PACKAGE_PIN K5 [get_ports PWM1_red]					
	set_property IOSTANDARD LVCMOS33 [get_ports PWM1_red]
#Bank = 15, Pin name = IO_L5P_T0_AD9P_15,					Sch name = LED16_G
set_property PACKAGE_PIN F13 [get_ports PWM1_green]				
	set_property IOSTANDARD LVCMOS33 [get_ports PWM1_green]
#Bank = 35, Pin name = IO_L19N_T3_VREF_35,					Sch name = LED16_B
set_property PACKAGE_PIN F6 [get_ports PWM1_blue]					
	set_property IOSTANDARD LVCMOS33 [get_ports PWM1_blue]
#Bank = 34, Pin name = IO_0_34,								Sch name = LED17_R
set_property PACKAGE_PIN K6 [get_ports PWM2_red]					
	set_property IOSTANDARD LVCMOS33 [get_ports PWM2_red]
#Bank = 35, Pin name = IO_24P_T3_35,						Sch name =  LED17_G
set_property PACKAGE_PIN H6 [get_ports PWM2_green]					
	set_property IOSTANDARD LVCMOS33 [get_ports PWM2_green]
#Bank = CONFIG, Pin name = IO_L3N_T0_DQS_EMCCLK_14,			Sch name = LED17_B
set_property PACKAGE_PIN L16 [get_ports PWM2_blue]					
	set_property IOSTANDARD LVCMOS33 [get_ports PWM2_blue]
	