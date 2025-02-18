module TOP_FIR #(parameter DATAWIDTH = 16 ,PRODUCT_WIDTH= 2*DATAWIDTH )(
    input clk,
    input rst,
    input start,
    input stop,
    input signed [DATAWIDTH-1:0] x,  // Input data
    output signed [PRODUCT_WIDTH-1:0] y,  // Output data
    output done               // Done signal

);

    // Internal wires for control signals
    wire ld_x, ld_y, ld_delay1, ld_delay2;
    
    // Instantiate the controller
    CONTROLLER_FIR #(DATAWIDTH) controller_inst (
        .clk(clk),
        .rst(rst),
        .start(start),
        .stop(stop),
        .ld_x(ld_x),
        .ld_y(ld_y),
        .ld_delay1(ld_delay1),
        .ld_delay2(ld_delay2),
        .done(done)
    );

    // Instantiate the datapath
    DATAPATH_FIR #(DATAWIDTH, PRODUCT_WIDTH) datapath_inst (
        .clk(clk),
        .rst(rst),
        .x(x),
        .ld_x(ld_x),
        .ld_y(ld_y),
        .ld_delay1(ld_delay1),
        .ld_delay2(ld_delay2),
        .y(y)
    );

endmodule
