## This file is a general .xdc for the Nexys4 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
#Bank = 35, Pin name = IO_L12P_T1_MRCC_35,					Sch name = CLK100MHZ
set_property PACKAGE_PIN E3 [get_ports Clocktop]							
	set_property IOSTANDARD LVCMOS33 [get_ports Clocktop]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports Clocktop]
 
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
#Bank = 34, Pin name = IO_L17N_T2_34,						Sch name = SW12
set_property PACKAGE_PIN T1 [get_ports {SWtop[12]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SWtop[12]}]
#Bank = 34, Pin name = IO_L11P_T1_SRCC_34,					Sch name = SW13
set_property PACKAGE_PIN R3 [get_ports {SWtop[13]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SWtop[13]}]
#Bank = 34, Pin name = IO_L14N_T2_SRCC_34,					Sch name = SW14
set_property PACKAGE_PIN P3 [get_ports {SWtop[14]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SWtop[14]}]
#Bank = 34, Pin name = IO_L14P_T2_SRCC_34,					Sch name = SW15
set_property PACKAGE_PIN P4 [get_ports {SWtop[15]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SWtop[15]}]
 

## LEDs
#Bank = 34, Pin name = IO_L24N_T3_34,						Sch name = LED0
set_property PACKAGE_PIN T8 [get_ports {LEDtop[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDtop[0]}]
#Bank = 34, Pin name = IO_L21N_T3_DQS_34,					Sch name = LED1
set_property PACKAGE_PIN V9 [get_ports {LEDtop[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDtop[1]}]
#Bank = 34, Pin name = IO_L24P_T3_34,						Sch name = LED2
set_property PACKAGE_PIN R8 [get_ports {LEDtop[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDtop[2]}]
#Bank = 34, Pin name = IO_L23N_T3_34,						Sch name = LED3
set_property PACKAGE_PIN T6 [get_ports {LEDtop[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDtop[3]}]
#Bank = 34, Pin name = IO_L12P_T1_MRCC_34,					Sch name = LED4
set_property PACKAGE_PIN T5 [get_ports {LEDtop[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDtop[4]}]
#Bank = 34, Pin name = IO_L12N_T1_MRCC_34,					Sch	name = LED5
set_property PACKAGE_PIN T4 [get_ports {LEDtop[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDtop[5]}]
#Bank = 34, Pin name = IO_L22P_T3_34,						Sch name = LED6
set_property PACKAGE_PIN U7 [get_ports {LEDtop[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDtop[6]}]
#Bank = 34, Pin name = IO_L22N_T3_34,						Sch name = LED7
set_property PACKAGE_PIN U6 [get_ports {LEDtop[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDtop[7]}]
##Bank = 34, Pin name = IO_L10N_T1_34,						Sch name = LED8
#set_property PACKAGE_PIN V4 [get_ports {LED[8]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {LED[8]}]
##Bank = 34, Pin name = IO_L8N_T1_34,						Sch name = LED9
#set_property PACKAGE_PIN U3 [get_ports {LED[9]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {LED[9]}]
##Bank = 34, Pin name = IO_L7N_T1_34,						Sch name = LED10
#set_property PACKAGE_PIN V1 [get_ports {LED[10]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {LED[10]}]
##Bank = 34, Pin name = IO_L17P_T2_34,						Sch name = LED11
#set_property PACKAGE_PIN R1 [get_ports {LED[11]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {LED[11]}]
##Bank = 34, Pin name = IO_L13N_T2_MRCC_34,					Sch name = LED12
#set_property PACKAGE_PIN P5 [get_ports {LED[12]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {LED[12]}]
##Bank = 34, Pin name = IO_L7P_T1_34,						Sch name = LED13
#set_property PACKAGE_PIN U1 [get_ports {LED[13]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {LED[13]}]
##Bank = 34, Pin name = IO_L15N_T2_DQS_34,					Sch name = LED14
#set_property PACKAGE_PIN R2 [get_ports {LED[14]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {LED[14]}]
##Bank = 34, Pin name = IO_L15P_T2_DQS_34,					Sch name = LED15
#set_property PACKAGE_PIN P2 [get_ports {LED[15]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {LED[15]}]


##Buttons
##Bank = 15, Pin name = IO_L3P_T0_DQS_AD1P_15,				Sch name = CPU_RESET
#set_property PACKAGE_PIN C12 [get_ports btnCpuReset]				
#	set_property IOSTANDARD LVCMOS33 [get_ports btnCpuReset]
##Bank = 15, Pin name = IO_L11N_T1_SRCC_15,					Sch name = BTNC
#set_property PACKAGE_PIN E16 [get_ports {BTN[4]}]						
#	set_property IOSTANDARD LVCMOS33 [get_ports {BTN[4]}]
#Bank = 15, Pin name = IO_L14P_T2_SRCC_15,					Sch name = BTNU
set_property PACKAGE_PIN F15 [get_ports {PBtop[2]}]						
	set_property IOSTANDARD LVCMOS33 [get_ports {PBtop[2]}]
##Bank = CONFIG, Pin name = IO_L15N_T2_DQS_DOUT_CSO_B_14,	Sch name = BTNL
#set_property PACKAGE_PIN T16 [get_ports {BTN[3]}]						
#	set_property IOSTANDARD LVCMOS33 [get_ports {BTN[3]}]
##Bank = 14, Pin name = IO_25_14,							Sch name = BTNR
#set_property PACKAGE_PIN R10 [get_ports {BTN[0]}]						
#	set_property IOSTANDARD LVCMOS33 [get_ports {BTN[0]}]
#Bank = 14, Pin name = IO_L21P_T3_DQS_14,					Sch name = BTND
set_property PACKAGE_PIN V10 [get_ports {PBtop[1]}]						
	set_property IOSTANDARD LVCMOS33 [get_ports {PBtop[1]}]
 
