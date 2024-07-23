class sha256_core_base_sequence extends uvm_sequence;
    `uvm_object_utils(sha256_core_base_sequence)
  
    function new(string name="sha256_core_base_sequence");
    super.new(name);
      `uvm_info("Base SEQ","Inside Constructor",UVM_HIGH)
  endfunction
  
  task body();
    `uvm_info("Base SEQ","Inside body task",UVM_HIGH)
  endtask: body
endclass: sha256_core_base_sequence
