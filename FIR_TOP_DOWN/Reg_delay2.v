`timescale 1ns/1ps
module Reg_delay2 #(DATAWIDTH = 16, PRODUCT_WIDTH = 2*DATAWIDTH)(
    input clk, 
    input rst,
    input signed [PRODUCT_WIDTH-1:0]tin_delay2,
    input ld_delay2,
    output signed [PRODUCT_WIDTH-1:0] tout_delay2
);
reg [PRODUCT_WIDTH-1:0] temp_delay2;
always@(posedge clk or posedge rst)
begin
    if (rst)
        temp_delay2 <= 0;
    else 
        if(ld_delay2)
        temp_delay2 <= tin_delay2;
    
end
assign tout_delay2 = temp_delay2;
endmodule