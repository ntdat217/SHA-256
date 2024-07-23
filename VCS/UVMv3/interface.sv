interface sha256_core_inf(input logic clock); //clk form tbtop->inf->dut
  logic reset;
  logic init;
  logic next;
  logic [511:0] block;
  logic ready;
  logic [255:0] digest;
  logic digest_valid;
endinterface: sha256_core_inf
