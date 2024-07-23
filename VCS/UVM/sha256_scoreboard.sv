`ifndef SHA256_SCOREBOARD_SV
`define SHA256_SCOREBOARD_SV
`include "uvm_macros.svh"
import uvm_pkg::*;

class sha256_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(sha256_scoreboard)

  uvm_analysis_export#(sha256_seq_item) analysis_export;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    analysis_export = new("analysis_export", this);
  endfunction

  function void write(sha256_seq_item item);
    if (item.expected_digest != item.digest) begin
      `uvm_error("SHA256_SCOREBOARD", $sformatf("Digest mismatch: Expected 0x%064x, got 0x%064x", item.expected_digest, item.digest));
    end else begin
      `uvm_info("SHA256_SCOREBOARD", $sformatf("Digest match: 0x%064x", item.digest), UVM_LOW);
    end
  endfunction

endclass

`endif // SHA256_SCOREBOARD_SV

