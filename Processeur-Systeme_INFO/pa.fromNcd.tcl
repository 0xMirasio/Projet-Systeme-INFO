
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name Processeur-Systeme_INFO -dir "/home/poncetta/Bureau/VHDL/Processeur-Systeme_INFO/planAhead_run_2" -part xc6slx16csg324-3
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "/home/poncetta/Bureau/VHDL/Processeur-Systeme_INFO/test_ALU.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/poncetta/Bureau/VHDL/Processeur-Systeme_INFO} }
set_property target_constrs_file "test_ALU.ucf" [current_fileset -constrset]
add_files [list {test_ALU.ucf}] -fileset [get_property constrset [current_run]]
open_netlist_design
read_xdl -file "/home/poncetta/Bureau/VHDL/Processeur-Systeme_INFO/test_ALU.ncd"
if {[catch {read_twx -name results_1 -file "/home/poncetta/Bureau/VHDL/Processeur-Systeme_INFO/test_ALU.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"/home/poncetta/Bureau/VHDL/Processeur-Systeme_INFO/test_ALU.twx\": $eInfo"
}
