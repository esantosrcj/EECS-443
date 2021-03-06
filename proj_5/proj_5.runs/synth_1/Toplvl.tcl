# 
# Synthesis run script generated by Vivado
# 

  set_param gui.test TreeTableDev
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1
set_property target_language Verilog [current_project]
set_param project.compositeFile.enableAutoGeneration 0
set_property default_lib xil_defaultlib [current_project]
read_vhdl -library xil_defaultlib {
  H:/School/Spring2015/EECS443/project_5/proj_5/proj_5.srcs/sources_1/new/EventGen.vhd
  H:/School/Spring2015/EECS443/project_5/proj_5/proj_5.srcs/sources_1/new/Count32.vhd
  H:/School/Spring2015/EECS443/project_5/proj_5/proj_5.srcs/sources_1/imports/project_4/memutils.vhd
  H:/School/Spring2015/EECS443/project_5/proj_5/proj_5.srcs/sources_1/new/Switcher.vhd
  H:/School/Spring2015/EECS443/project_5/proj_5/proj_5.srcs/sources_1/new/RegFile.vhd
  H:/School/Spring2015/EECS443/project_5/proj_5/proj_5.srcs/sources_1/new/Holder.vhd
  H:/School/Spring2015/EECS443/project_5/proj_5/proj_5.srcs/sources_1/new/Delay.vhd
  H:/School/Spring2015/EECS443/project_5/proj_5/proj_5.srcs/sources_1/new/Toplvl.vhd
}
read_xdc H:/School/Spring2015/EECS443/project_5/proj_5/proj_5.srcs/constrs_1/new/Nexys4_Master.xdc
set_property used_in_implementation false [get_files H:/School/Spring2015/EECS443/project_5/proj_5/proj_5.srcs/constrs_1/new/Nexys4_Master.xdc]

set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir H:/School/Spring2015/EECS443/project_5/proj_5/proj_5.cache/wt [current_project]
set_property parent.project_dir H:/School/Spring2015/EECS443/project_5/proj_5 [current_project]
catch { write_hwdef -file Toplvl.hwdef }
synth_design -top Toplvl -part xc7a100tcsg324-1
write_checkpoint Toplvl.dcp
report_utilization -file Toplvl_utilization_synth.rpt -pb Toplvl_utilization_synth.pb
