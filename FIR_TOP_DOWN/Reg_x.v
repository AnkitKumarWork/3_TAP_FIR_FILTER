`timescale 1ns/1ps
module Reg_x #(DATAWIDTH = 16 )(
    input clk, 
    input rst,
    input signed [DATAWIDTH-1:0]x,
    input ld_x,
    output signed [DATAWIDTH-1:0] tout_x
);
reg [DATAWIDTH-1:0] temp_x;
always@(posedge clk or posedge rst)
begin
    if (rst)
        temp_x <= 0;
    else 
        if(ld_x)
        temp_x <= x;
    
end
assign tout_x = temp_x;
endmodule