module CONTROLLER_FIR #(parameter DATAWIDTH = 16)(
    input clk,
    input rst,
    input start,
    input stop,
    output reg ld_x,
    output reg ld_y,
    output reg ld_delay1,
    output reg ld_delay2,
    output reg done
);
    reg [1:0] ps, ns;
localparam START = 2'b00,
          RUNNING = 2'b01,
          DONE = 2'b10;



always @(posedge clk or posedge rst) begin
    if (rst)
        ps <= START;
    else
        ps <= ns;
end

always @(*) begin
    case (ps)
        START:ns = start ? RUNNING : START;
        RUNNING: ns = stop ? DONE : RUNNING;
        DONE: ns = DONE;
        default: ns = START;

    endcase
end

always @(*) begin
    case (ps)
        START: begin
            ld_x = 1'b0;
            ld_y = 1'b0;
            ld_delay1 = 1'b0;
            ld_delay2 = 1'b0;
            done = 1'b0;
        end
        RUNNING: begin
            ld_x = 1'b1;
            ld_y = 1'b0;
            ld_delay1 = 1'b1;
            ld_delay2 = 1'b1;
            done = 1'b0;
        end
        DONE: begin
            ld_x = 1'b0;
            ld_y = 1'b1;
            ld_delay1 = 1'b0;
            ld_delay2 = 1'b0;
            done = 1'b1;
        end
        default: begin
            ld_x = 1'b0;
            ld_y = 1'b0;
            ld_delay1 = 1'b0;
            ld_delay2 = 1'b0;
            done = 1'b0;
        end
    endcase
end
endmodule
