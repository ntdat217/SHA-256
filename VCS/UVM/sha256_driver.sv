`ifndef SHA256_DRIVER_SV
`define SHA256_DRIVER_SV
`include "uvm_macros.svh"
import uvm_pkg::*;

class sha256_driver extends uvm_driver#(sha256_seq_item);
  `uvm_component_utils(sha256_driver)

  virtual sha256_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual sha256_if)::get(this, "", "vif", vif))
      `uvm_fatal("SHA256_DRIVER", "Virtual interface not found");
  endfunction

  task run_phase(uvm_phase phase);
    sha256_seq_item req;
    forever begin
      seq_item_port.get_next_item(req);
      // Drive req to the DUT
      vif.block = req.block;
      vif.init = req.init;
      vif.next = req.next;
      seq_item_port.item_done();
    end
  endtask
endclass

`endif // SHA256_DRIVER_SV

