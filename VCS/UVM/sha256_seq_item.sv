`ifndef SHA256_SEQ_ITEM_SV
`define SHA256_SEQ_ITEM_SV
`include "uvm_macros.svh"
import uvm_pkg::*;

class sha256_seq_item extends uvm_sequence_item;
  `uvm_object_utils_begin(sha256_seq_item)
    `uvm_field_int(block, UVM_DEFAULT)
    `uvm_field_int(init, UVM_DEFAULT)
    `uvm_field_int(next, UVM_DEFAULT)
    `uvm_field_int(expected_digest, UVM_DEFAULT)
    `uvm_field_int(digest, UVM_DEFAULT) // Added digest field
  `uvm_object_utils_end

  rand logic [511:0] block;
  rand bit init;
  rand bit next;
  rand logic [255:0] expected_digest;
  rand logic [255:0] digest; // Added digest field

  function new(string name = "sha256_seq_item");
    super.new(name);
  endfunction

  function void do_print(uvm_printer printer);
    super.do_print(printer);
    printer.print_field("block", block, 512);
    printer.print_field("init", init, 1);
    printer.print_field("next", next, 1);
    printer.print_field("expected_digest", expected_digest, 256);
    printer.print_field("digest", digest, 256); // Added digest field
  endfunction
endclass

`endif // SHA256_SEQ_ITEM_SV

