module controller_fir#(parameter DATAWIDHT = 16)(
    input clk,
    input rst,
    input start,
    input stop,
    output reg ld_reg,
    output reg ld_out,
    output reg done
);
reg [1:0] ps, ns;
localparam idle = 2'b00, running = 2'b01, finish = 2'b10;

always @(posedge clk or posedge rst) begin
    if(rst)
        ps <= idle;
    else
        ps <= ns;
end

always @(*) begin
    case(ps)
        idle: ns = start ? running : idle;
        running: ns = stop ? finish : running;
        finish: ns = idle;
        default: ns = idle;
    endcase
end
always @(*) begin
    case(ps)
        idle: begin
            ld_reg = 0;
            ld_out = 0;
            done = 0;
        end
        running: begin
            ld_reg = 1;
            ld_out = 0;
            done = 0;
        end
        finish : begin
            ld_reg = 0;
            ld_out = 1;
            done = 1;
        end
        default: begin
            ld_reg = 0;
            ld_out = 0;
            done = 0;
        end
    endcase
end

endmodule