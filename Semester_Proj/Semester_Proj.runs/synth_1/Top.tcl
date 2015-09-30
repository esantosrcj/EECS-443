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
  H:/School/Spring2015/EECS443/semester/Semester_Proj/Semester_Proj.srcs/sources_1/new/RGBLed.vhd
  H:/School/Spring2015/EECS443/semester/Semester_Proj/Semester_Proj.srcs/sources_1/new/RgbPWM.vhd
  H:/School/Spring2015/EECS443/semester/Semester_Proj/Semester_Proj.srcs/sources_1/new/Cnt.vhd
}
read_xdc H:/School/Spring2015/EECS443/semester/Semester_Proj/Semester_Proj.srcs/constrs_1/new/Semester_Project.xdc
set_property used_in_implementation false [get_files H:/School/Spring2015/EECS443/semester/Semester_Proj/Semester_Proj.srcs/constrs_1/new/Semester_Project.xdc]

set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir H:/School/Spring2015/EECS443/semester/Semester_Proj/Semester_Proj.cache/wt [current_project]
set_property parent.project_dir H:/School/Spring2015/EECS443/semester/Semester_Proj [current_project]
catch { write_hwdef -file Top.hwdef }
synth_design -top Top -part xc7a100tcsg324-1
write_checkpoint Top.dcp
report_utilization -file Top_utilization_synth.rpt -pb Top_utilization_synth.pb
