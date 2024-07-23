interface sha256_if(input logic clk, input logic reset);
  logic init;
  logic next;
  logic [511:0] block;
  logic ready;
  logic [255:0] digest;
  logic digest_valid;

  // Modport definitions for different roles
  modport dut (input init, input next, input block, output ready, output digest, output digest_valid);
  modport driver (output init, output next, output block);
  modport monitor (input init, input next, input block, input ready, input digest, input digest_valid);
endinterface

