set link_library   /home/eda/libraries/SAED32_EDK_03312022/SAED32nm_EDK_01252022/lib/stdcell_hvt/db_ccs/saed32hvt_ss0p75v125c.db
set target_library  /home/eda/libraries/SAED32_EDK_03312022/SAED32nm_EDK_01252022/lib/stdcell_hvt/db_ccs/saed32hvt_ss0p75v125c.db


read_verilog [list ../src/rtl/sha256_core.v ../src/rtl/sha256_k_constants.v ../src/rtl/sha256_w_mem.v]
current_design sha256_core
Link

# operating condition and timing constraints
source -e -v ../src/sdc/sha256core.sdc
#load_upf ../../upf/snps_bit_slice.upf
#source -e -v scripts/snps_set_voltage.tcl
#check_mv_design

set DESIGN_NAME sha256_core
set RESULTS_DIR ./results_sha256_core

compile_ultra -no_autoungroup 

change_names -rule verilog -hier

#reports
file mkdir $RESULTS_DIR
write -f verilog -hier -o ${RESULTS_DIR}/${DESIGN_NAME}.vg
write -f ddc -hier -o ${RESULTS_DIR}/${DESIGN_NAME}.ddc
#save_upf ${RESULTS_DIR}/${DESIGN_NAME}.upf
write_sdc ${RESULTS_DIR}/${DESIGN_NAME}.sdc
#write_script -output ${RESULTS_DIR}/${DESIGN_NAME}.script
#write_parasitics -output ${RESULTS_DIR}/${DESIGN_NAME}_compiled.spef
#write_sdf ${RESULTS_DIR}/${DESIGN_NAME}_compiled.sdf

report_area -hierarchy > ${RESULTS_DIR}/${DESIGN_NAME}.area
report_timing > ${RESULTS_DIR}/${DESIGN_NAME}.timing
report_power > ${RESULTS_DIR}/${DESIGN_NAME}.power
gui_start

