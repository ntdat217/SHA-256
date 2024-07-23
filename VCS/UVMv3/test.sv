class sha256_core_test extends uvm_test;
  `uvm_component_utils(sha256_core_test)
  function new(string name = "sha256_core_test", uvm_component parent);
    super.new(name,parent);
    `uvm_info("Test class","Inside constructor",UVM_HIGH)
  endfunction: new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("Test class","Inside build phase",UVM_HIGH)
  endfunction: build_phase
  
   function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("Test class","Inside connect phase",UVM_HIGH)
  endfunction: connect_phase
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
  endtask: run_phase
  
endclass: sha256_core_test
