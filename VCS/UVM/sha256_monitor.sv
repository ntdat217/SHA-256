`ifndef SHA256_MONITOR_SV
`define SHA256_MONITOR_SV
`include "uvm_macros.svh"
import uvm_pkg::*;

class sha256_monitor extends uvm_monitor;
  `uvm_component_utils(sha256_monitor)

  virtual sha256_if vif;
  uvm_analysis_port#(sha256_seq_item) item_collected_port;
  sha256_seq_item mon_item;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    item_collected_port = new("item_collected_port", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual sha256_if)::get(this, "", "vif", vif))
      `uvm_fatal("SHA256_MONITOR", "Virtual interface not found");
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      // Sample DUT signals and create transaction
      mon_item = sha256_seq_item::type_id::create("mon_item");
      mon_item.block = vif.block;
      mon_item.init = vif.init;
      mon_item.next = vif.next;
      mon_item.digest = vif.digest; // Capturing digest from interface
      item_collected_port.write(mon_item);
    end
  endtask
endclass

`endif // SHA256_MONITOR_SV

