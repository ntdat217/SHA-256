# Set gate-level monitoring
power -gate_level rtl_on

#Set Toggle Region
power tb_sha256_core

# Enable power measurement
power -enable

# Run simulation for 1000ns (adjust as needed)
run 1 s

# Stop toggle counting
power -disable

# Generate the SAIF report (ensure module name is correct)
power -report "output.saif" "ns" "tb_sha256_core"

# End simulation
quit

