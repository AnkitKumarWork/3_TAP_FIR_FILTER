module top_fir #(parameter DATAWIDTH = 16)(
    input clk,
    input rst,
    input start,
    input stop,
    input signed [DATAWIDTH-1:0] x,
    output signed [DATAWIDTH*2-1:0] y,
    output done
);

    wire ld_reg;
    wire ld_out;
    // Instantiate the controller module
    controller_fir #(DATAWIDTH) controller_inst (
        .clk(clk),
        .rst(rst),
        .start(start),
        .stop(stop),
        .ld_reg(ld_reg),
        .ld_out(ld_out),
        .done(done)
    );
    
    // Instantiate the datapath_fir module
    datapath_fir #(DATAWIDTH) datapath_inst (
        .clk(clk),
        .rst(rst),
        .x(x),
        .ld_reg(ld_reg),
        .ld_out(ld_out),
        .y(y)
    );
    
endmodule
