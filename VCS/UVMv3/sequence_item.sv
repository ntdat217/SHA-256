class sha256_core_seq_item extends uvm_sequence_item;
  `uvm_object_utils(sha256_core_seq_item)
  
  //Set input signal
  logic reset;
  logic init;
  logic next;
  logic [511:0] block;
  logic ready;
  logic [255:0] digest;
  logic digest_valid;
  
  function new(string name = "sha256_core_seq_item");
    super.new(name);
    endfunction: new
endclass: sha256_core_seq_item
