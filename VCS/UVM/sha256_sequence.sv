`ifndef SHA256_SEQUENCE_SV
`define SHA256_SEQUENCE_SV
`include "uvm_macros.svh"
import uvm_pkg::*;

class sha256_sequence extends uvm_sequence#(sha256_seq_item);
  `uvm_object_utils(sha256_sequence)

  function new(string name = "sha256_sequence");
    super.new(name);
  endfunction

  task body();
    sha256_seq_item item;
    
    // Example sequence for single block message: "abc"
    item = sha256_seq_item::type_id::create("item");
    start_item(item);
    item.block = 512'h61626380000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018;
    item.init = 1;
    item.next = 0;
    item.expected_digest = 256'hBA7816BF8F01CFEA414140DE5DAE2223B00361A396177A9CB410FF61F20015AD;
    finish_item(item);

    // Example sequence for double block message: "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"
    item = sha256_seq_item::type_id::create("item");
    start_item(item);
    item.block = 512'h6162636462636465636465666465666765666768666768696768696A68696A6B696A6B6C6A6B6C6D6B6C6D6E6C6D6E6F6D6E6F706E6F70718000000000000000;
    item.init = 1;
    item.next = 0;
    item.expected_digest = 256'h85E655D6417A17953363376A624CDE5C76E09589CAC5F811CC4B32C1F20E533A;
    finish_item(item);

    item = sha256_seq_item::type_id::create("item");
    start_item(item);
    item.block = 512'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001C0;
    item.init = 0;
    item.next = 1;
    item.expected_digest = 256'h248D6A61D20638B8E5C026930C3E6039A33CE45964FF2167F6ECEDD419DB06C1;
    finish_item(item);
  endtask
endclass

`endif // SHA256_SEQUENCE_SV

