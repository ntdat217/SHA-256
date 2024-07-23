
create_clock -name clk -period 10 [get_ports clk]


set_input_delay -clock clk -max 2 [get_ports init]
set_input_delay -clock clk -max 2 [get_ports next]
set_input_delay -clock clk -max 2 [get_ports block]


set_output_delay -clock clk -max 2 [get_ports ready]
set_output_delay -clock clk -max 2 [get_ports digest[*]]
set_output_delay -clock clk -max 2 [get_ports digest_valid]


set_clock_uncertainty 0.5 [get_clocks clk]


set_max_delay 10 -from [get_cells H0_reg_reg*] -to [get_ports digest[255:224]]
set_max_delay 10 -from [get_cells H1_reg_reg*] -to [get_ports digest[223:192]]
set_max_delay 10 -from [get_cells H2_reg_reg*] -to [get_ports digest[191:160]]
set_max_delay 10 -from [get_cells H3_reg_reg*] -to [get_ports digest[159:128]]
set_max_delay 10 -from [get_cells H4_reg_reg*] -to [get_ports digest[127:96]]
set_max_delay 10 -from [get_cells H5_reg_reg*] -to [get_ports digest[95:64]]
set_max_delay 10 -from [get_cells H6_reg_reg*] -to [get_ports digest[63:32]]
set_max_delay 10 -from [get_cells H7_reg_reg*] -to [get_ports digest[31:0]]


set_false_path -from [get_ports reset_n] -to [get_clocks clk]

