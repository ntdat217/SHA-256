`ifndef SHA256_ENV_SV
`define SHA256_ENV_SV
`include "uvm_macros.svh"
import uvm_pkg::*;
`include "sha256_agent.sv"
`include "sha256_scoreboard.sv"

class sha256_env extends uvm_env;
  `uvm_component_utils(sha256_env)

  sha256_agent agt;
  sha256_scoreboard sb;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt = sha256_agent::type_id::create("agt", this);
    sb = sha256_scoreboard::type_id::create("sb", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agt.mon.item_collected_port.connect(sb.analysis_export);
  endfunction
endclass

`endif // SHA256_ENV_SV

