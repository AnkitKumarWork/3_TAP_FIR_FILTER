`timescale 1ns/1ps
module ADDER1#(parameter DATAWIDTH = 16, PRODUCT_WIDTH= 2*DATAWIDTH)(
    input signed [PRODUCT_WIDTH-1:0] tin_a,
    input signed [PRODUCT_WIDTH-1:0] tin_b,
    output signed [PRODUCT_WIDTH-1:0] tout_add
);
assign tout_add = tin_a + tin_b;
endmodule