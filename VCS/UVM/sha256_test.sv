`ifndef SHA256_TEST_SV
`define SHA256_TEST_SV
`include "uvm_macros.svh"
import uvm_pkg::*;
`include "sha256_env.sv"

class sha256_test extends uvm_test;
  `uvm_component_utils(sha256_test)

  sha256_env env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = sha256_env::type_id::create("env", this);
  endfunction

  task run_phase(uvm_phase phase);
    sha256_sequence seq;
    phase.raise_objection(this);
    seq = sha256_sequence::type_id::create("seq");
    seq.start(env.agt.seqr);
    phase.drop_objection(this);
  endtask
endclass

`endif // SHA256_TEST_SV

