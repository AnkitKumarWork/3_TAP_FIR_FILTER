`timescale 1ns/1ps
module Reg_y #(DATAWIDTH = 16, PRODUCT_WIDTH = 2*DATAWIDTH)(
    input clk, 
    input rst,
    input signed [ PRODUCT_WIDTH-1:0]tin_y,
    input ld_y,
    output signed [ PRODUCT_WIDTH-1:0] tout_y
);
reg [ PRODUCT_WIDTH-1:0] temp_y;
always@(posedge clk or posedge rst)
begin
    if (rst)
        temp_y <= 0;
    else 
        if(ld_y)
        temp_y <= tin_y;
    
end
assign tout_y = temp_y;
endmodule