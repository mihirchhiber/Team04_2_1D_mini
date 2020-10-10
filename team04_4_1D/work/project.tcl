set projDir "C:/Users/mihir/OneDrive/Documents/alchitry/team04_4_1D/work/vivado"
set projName "team04_4_1D"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/mihir/OneDrive/Documents/alchitry/team04_4_1D/work/verilog/au_top_0.v" "C:/Users/mihir/OneDrive/Documents/alchitry/team04_4_1D/work/verilog/counter_1.v" "C:/Users/mihir/OneDrive/Documents/alchitry/team04_4_1D/work/verilog/three_bit_adder_2.v" "C:/Users/mihir/OneDrive/Documents/alchitry/team04_4_1D/work/verilog/full_adder_3.v" "C:/Users/mihir/OneDrive/Documents/alchitry/team04_4_1D/work/verilog/edge_detector_4.v" "C:/Users/mihir/OneDrive/Documents/alchitry/team04_4_1D/work/verilog/reset_conditioner_5.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/mihir/OneDrive/Documents/alchitry/team04_4_1D/work/constraint/io_pin.xdc" "C:/Users/mihir/OneDrive/Documents/alchitry/team04_4_1D/constraint/io_custom.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
