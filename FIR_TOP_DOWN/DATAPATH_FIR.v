module DATAPATH_FIR #(parameter DATAWIDTH = 16, PRODUCT_WIDTH= 2*DATAWIDTH)(
    input clk, 
    input rst,
    input signed [DATAWIDTH-1:0] x,
    input ld_x,
    input ld_y,
    input ld_delay1,
    input ld_delay2,
    output signed [PRODUCT_WIDTH-1:0] y
);
  wire signed [DATAWIDTH-1:0] temp_x;
  wire signed [DATAWIDTH-1:0] tout_delay1;
   wire signed [PRODUCT_WIDTH-1:0] tout_delay2;
  wire signed [PRODUCT_WIDTH-1:0] tout_mul1;
  wire signed [PRODUCT_WIDTH-1:0] tout_mul2;
  wire signed [PRODUCT_WIDTH-1:0] tout_mul3;
  wire signed [PRODUCT_WIDTH-1:0] tout_add1;
  wire signed [PRODUCT_WIDTH-1:0] tout_add2;
  
localparam signed [DATAWIDTH-1:0] h0 = 16'sb0_0000000_01000000; //h0 = 0.25
localparam signed [DATAWIDTH-1:0] h1 = 16'sb0_0000000_10000000; //h1 = 0.50
localparam signed [DATAWIDTH-1:0] h2 = 16'sb0_0000000_01000000; //h2 = 0.25

Reg_x #(DATAWIDTH) Reg_x_inst(
    .clk(clk),
    .rst(rst),
    .x(x),
    .ld_x(ld_x),
    .tout_x(temp_x)
);

Reg_delay1 #(DATAWIDTH) Reg_delay1_inst(
    .clk(clk),
    .rst(rst),
    .tin_delay1(tout_mul1),
    .ld_delay1(ld_delay1),
    .tout_delay1(tout_delay1)
);

MUL1 #(DATAWIDTH) MUL1_inst(
    .tin_a(temp_x),
    .tin_b(h2),
    .mul_out(tout_mul1)
);

MUL2 #(DATAWIDTH) MUL2_inst(
    .tin_a(temp_x),
    .tin_b(h1),
    .mul_out(tout_mul2)
);

Reg_delay2 #(DATAWIDTH) Reg_delay2_inst(
    .clk(clk),
    .rst(rst),
    .tin_delay2(tout_add1),
    .ld_delay2(ld_delay2),
    .tout_delay2(tout_delay2)
);

ADDER1 #(DATAWIDTH) ADD1_inst(
    .tin_a(tout_delay1),
    .tin_b(tout_mul2),
    .tout_add(tout_add1)
);

MUL3 #(DATAWIDTH) MUL3_inst(
    .tin_a(temp_x),
    .tin_b(h0),
    .mul_out(tout_mul3)
);

ADDER2 #(DATAWIDTH) ADD2_inst(
    .tin_a(tout_delay2),
    .tin_b(tout_mul3),
    .tout_add(tout_add2)
);

Reg_y #(DATAWIDTH) Reg_y_inst(
    .clk(clk),
    .rst(rst),
    .tin_y(tout_add2),
    .ld_y(ld_y),
    .tout_y(y)
);
endmodule
