`ifndef SHA256_SEQUENCER_SV
`define SHA256_SEQUENCER_SV
`include "uvm_macros.svh"
import uvm_pkg::*;

class sha256_sequencer extends uvm_sequencer#(sha256_seq_item);
  `uvm_component_utils(sha256_sequencer)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass

`endif // SHA256_SEQUENCER_SV

