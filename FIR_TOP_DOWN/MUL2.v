`timescale 1ns/1ps
module MUL2 #(parameter DATAWIDTH = 16, PRODUCT_WIDTH= 2*DATAWIDTH)(
    input signed [DATAWIDTH-1:0]tin_a,
    input signed[DATAWIDTH-1:0]tin_b,
    output signed [PRODUCT_WIDTH-1:0] mul_out
);
assign mul_out = tin_a*tin_b;
endmodule

