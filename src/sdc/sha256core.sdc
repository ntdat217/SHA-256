
create_clock -name clk -period 10 [get_ports clk]


set_input_delay -clock clk -max 5 [get_ports reset_n]
set_input_delay -clock clk -min 0 [get_ports reset_n]


set_input_delay -clock clk -max 2 [get_ports init]
set_input_delay -clock clk -min 0 [get_ports init]
set_input_delay -clock clk -max 2 [get_ports next]
set_input_delay -clock clk -min 0 [get_ports next]
set_input_delay -clock clk -max 2 [get_ports block]
set_input_delay -clock clk -min 0 [get_ports block]


set_output_delay -clock clk -max 2 [get_ports ready]
set_output_delay -clock clk -min 0 [get_ports ready]
set_output_delay -clock clk -max 2 [get_ports digest]
set_output_delay -clock clk -min 0 [get_ports digest]
set_output_delay -clock clk -max 2 [get_ports digest_valid]
set_output_delay -clock clk -min 0 [get_ports digest_valid]


set_max_delay 15 -from [get_ports block] -to [get_ports digest]
set_max_delay 15 -from [get_ports block] -to [get_ports digest_valid]


set_false_path -from [get_ports reset_n] -to [get_ports clk]
set_false_path -from [get_ports reset_n] -to [get_ports init]
set_false_path -from [get_ports reset_n] -to [get_ports next]


set_clock_uncertainty 0.5 [get_clocks clk]

