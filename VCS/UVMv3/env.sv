class sha256_core_env extends uvm_env;
  `uvm_component_utils(sha256_core_env)
  function new(string name = "sha256_core_env", uvm_component parent);
    super.new(name,parent);
    `uvm_info("ENV class","Inside constructor",UVM_HIGH)
  endfunction: new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("ENV class","Inside build phase",UVM_HIGH)
  endfunction: build_phase
  
   function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("ENV class","Inside connect phase",UVM_HIGH)
  endfunction: connect_phase
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
  endtask: run_phase
  
endclass: sha256_core_env
