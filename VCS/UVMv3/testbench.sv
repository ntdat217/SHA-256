`timescale 1ns / 1ps

import uvm_pkg::*;
`include "uvm_macros.svh"
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"

module top;
  
  logic clock;
  sha256_core_inf inf(.clock(clock));//connect clk to inf
  
  sha256_core dut(	//connect inf with dut
    .clk(inf.clock),
    .reset_n(inf.reset),
    .init(inf.init),
    .next(inf.next),
    .block(inf.block),
    .ready(inf.ready),
    .digest(inf.digest),
    .digest_valid(inf.digest_valid)
  );
  
  initial begin
    run_test("sha256_core_test");
  end
  
  initial begin
    clock = 0;
    #5;
    forever begin
      clock = ~clock;
      #2;
  	end
  end
  initial begin
    #5000;
    $display("ran out of clk");
    $finish();
  end 
  initial begin
    $dumpfile("d.vcd");
    $dumpvars();
  end
endmodule: top
