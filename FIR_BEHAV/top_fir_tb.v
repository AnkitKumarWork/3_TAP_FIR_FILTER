`timescale 1ns / 1ps

module top_fir_tb;


    parameter DATAWIDTH = 16;
     reg clk;
    reg rst;
    reg start;
    reg stop;
    reg signed [DATAWIDTH-1:0] x;

    wire signed [DATAWIDTH*2-1:0] y;
    wire done;

    top_fir#(DATAWIDTH)  uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .stop(stop),
        .x(x),
        .y(y),
        .done(done)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;  // Clock period = 10ns
    end

    
    initial begin
        clk = 0;
        x= 16'sb0000000000000000;
        rst = 1;
        #18;
        rst = 0;
        #1;
        #1;
        //////////////////// test case for x = 0.5/////////////
        start = 1;
        #10;
        x= 16'sb0000000010000000;
        stop = 0;
        #40;
        start = 0;
        stop = 1;
        
        #40;
        //////////////////// test case for x = 0.4/////////////
        rst = 1;
        #10;
        rst = 0;
        start = 1;
        #10;
        x= 16'sb0000000001100110;
        stop = 0;
        #40;
        start = 0;
        stop = 1;
        
        #40;
        
        //////////////////// test case for x = 0.2/////////////
        rst = 1;
        #10;
        rst = 0;
        start = 1;
        #10;
        x= 16'sb0000000000110011;
        stop = 0;
        #40;
        start = 0;
        stop = 1;
        
        #40;
       //////////////////// test case for x = 0.6/////////////
        rst = 1;
        #40;
        rst = 0;
        start = 1;
        #10;
        x= 16'sb0000000010011010;
        stop = 0;
        #40;
        start = 0;
        stop = 1;
        
        #40; 
         //////////////////// test case for x = 0.3/////////////
        rst = 1;
        #10;
        rst = 0;
        start = 1;
        #10;
        x= 16'sb0000000001001101;
        stop = 0;
        #40;
        start = 0;
        stop = 1;
        
        #40;
       $finish();
    end

endmodule
