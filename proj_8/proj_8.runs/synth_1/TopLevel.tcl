# 
# Synthesis run script generated by Vivado
# 

  set_param gui.test TreeTableDev
  set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Labtools 27-147} -limit 4294967295
create_project -in_memory -part xc7a100tcsg324-1
set_property target_language Verilog [current_project]
set_param project.compositeFile.enableAutoGeneration 0
set_property default_lib xil_defaultlib [current_project]
read_vhdl -library xil_defaultlib {
  H:/School/Spring2015/EECS443/project_8/proj_8/proj_8.srcs/sources_1/imports/lab6sources/memutils.vhd
  H:/School/Spring2015/EECS443/project_8/proj_8/proj_8.srcs/sources_1/new/SUMRegister.vhd
  H:/School/Spring2015/EECS443/project_8/proj_8/proj_8.srcs/sources_1/new/Accumulator.vhd
  H:/School/Spring2015/EECS443/project_8/proj_8/proj_8.srcs/sources_1/new/RegFile.vhd
  H:/School/Spring2015/EECS443/project_8/proj_8/proj_8.srcs/sources_1/new/Multiplexer.vhd
  H:/School/Spring2015/EECS443/project_8/proj_8/proj_8.srcs/sources_1/new/Convolutor.vhd
  H:/School/Spring2015/EECS443/project_8/proj_8/proj_8.srcs/sources_1/new/TopLevel.vhd
  H:/School/Spring2015/EECS443/project_8/proj_8/proj_8.srcs/sources_1/imports/project_9/simulation.vhd
}
read_xdc H:/School/Spring2015/EECS443/project_8/proj_8/proj_8.srcs/constrs_1/new/Nexys4_Master.xdc
set_property used_in_implementation false [get_files H:/School/Spring2015/EECS443/project_8/proj_8/proj_8.srcs/constrs_1/new/Nexys4_Master.xdc]

set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir H:/School/Spring2015/EECS443/project_8/proj_8/proj_8.cache/wt [current_project]
set_property parent.project_dir H:/School/Spring2015/EECS443/project_8/proj_8 [current_project]
catch { write_hwdef -file TopLevel.hwdef }
synth_design -top TopLevel -part xc7a100tcsg324-1
write_checkpoint TopLevel.dcp
report_utilization -file TopLevel_utilization_synth.rpt -pb TopLevel_utilization_synth.pb
