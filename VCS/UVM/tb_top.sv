`timescale 1ns / 1ps

`include "uvm_macros.svh"
import uvm_pkg::*;
`include "interface.sv"
`include "sha256_seq_item.sv"
`include "sha256_driver.sv"
`include "sha256_monitor.sv"
`include "sha256_sequencer.sv"
`include "sha256_sequence.sv"
`include "sha256_scoreboard.sv"
`include "sha256_agent.sv"
`include "sha256_env.sv"
`include "sha256_test.sv"

module tb_top;
  bit clk;
  bit reset;

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    clk = 0;
    reset = 1;
    #10;
    reset = 0;
  end

  // Interface instantiation
  sha256_if vif(clk, reset);

  initial begin
    // Set virtual interface in config_db
    uvm_config_db#(virtual sha256_if)::set(uvm_root::get(), "*", "vif", vif);

    // Dump waves for debugging
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_top);

    // Run the UVM test
    run_test("sha256_test");
  end

  // DUT instantiation
  sha256_core DUT (
    .clk(vif.clk),
    .reset_n(vif.reset),
    .init(vif.init),
    .next(vif.next),
    .block(vif.block),
    .ready(vif.ready),
    .digest(vif.digest),
    .digest_valid(vif.digest_valid)
  );
endmodule

