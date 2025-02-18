`timescale 1ns/1ps
module Reg_delay1 #(DATAWIDTH = 16, PRODUCT_WIDTH = 2*DATAWIDTH )(
    input clk, 
    input rst,
    input signed [PRODUCT_WIDTH-1:0]tin_delay1,
    input ld_delay1,
    output signed [PRODUCT_WIDTH-1:0] tout_delay1
);
reg [PRODUCT_WIDTH-1:0] temp_delay1;
always@(posedge clk or posedge rst)
begin
    if (rst)
        temp_delay1 <= 0;
    else 
        if(ld_delay1)
        temp_delay1 <= tin_delay1;
    
end
assign tout_delay1 = temp_delay1;
endmodule