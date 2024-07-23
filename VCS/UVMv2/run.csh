#! /bin/tcsh
source /home/eda/snps_setup

vcs	-sverilog -ntb_opts uvm-1.2 -timescale=1ps/1ps	-l compile.log	-debug_access+r	-full64 -f filelist.f	-R ../../src/rtl/sha256_core.v tb_top.sv 
#./simv -gui
