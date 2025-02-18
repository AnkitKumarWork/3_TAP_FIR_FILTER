module datapath_fir #(parameter DATAWIDTH = 16 )(
    input clk, 
    input rst,
    input signed [DATAWIDTH-1:0] x,
    input ld_reg,
    input ld_out,
    output signed [DATAWIDTH*2-1:0] y
);

localparam PRODUCT_WIDTH = DATAWIDTH * 2;

reg signed [PRODUCT_WIDTH-1:0] y_reg;
reg signed [DATAWIDTH-1:0] x_reg;
reg signed [PRODUCT_WIDTH-1:0] tout_delay_reg1;
reg signed [PRODUCT_WIDTH-1:0] tout_delay_reg2;

wire signed [PRODUCT_WIDTH-1:0] tout_mul1;
wire signed [PRODUCT_WIDTH-1:0] tout_mul2;
wire signed [PRODUCT_WIDTH-1:0] tout_mul3;
wire signed [PRODUCT_WIDTH-1:0] tout_add1;
//wire signed [PRODUCT_WIDTH-1:0] temp_delay_reg1;
//wire signed [PRODUCT_WIDTH-1:0] temp_delay_reg2;
wire signed [PRODUCT_WIDTH-1:0] temp_y;

localparam signed [DATAWIDTH-1:0] h0 = 16'sb0_0000000_01000000; //h0 = 0.25
localparam signed [DATAWIDTH-1:0] h1 = 16'sb0_0000000_10000000; //h1 = 0.50
localparam signed [DATAWIDTH-1:0] h2 = 16'sb0_0000000_01000000; //h2 = 0.25

always @(posedge clk or posedge rst) begin
    if(rst)
        x_reg <= 0;
    else if(ld_reg)
        x_reg <= x;
end

always @(posedge clk or posedge rst) begin
    if(rst)
        tout_delay_reg1 <= 0;
    else if(ld_reg)
        tout_delay_reg1 <= tout_mul1;
end

always @(posedge clk or posedge rst) begin
    if(rst)
        tout_delay_reg2 <= 0;
    else if(ld_reg)
        tout_delay_reg2 <= tout_add1; 
end

always @(posedge clk or posedge rst) begin
    if(rst)
        y_reg <= 0;
    else if(ld_out)
        y_reg <= temp_y;
end

assign tout_mul1 = h2 * x_reg;
assign tout_mul2 = h1 * x_reg; 
assign tout_mul3 = h0 * x_reg;
assign tout_add1 = tout_mul2 + tout_delay_reg1;
assign temp_y = tout_delay_reg2 + tout_mul3;
assign y = y_reg; 

endmodule
