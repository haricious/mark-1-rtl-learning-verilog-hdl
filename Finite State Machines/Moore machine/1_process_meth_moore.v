`timescale 1ns / 1ps

module fsm(
    input clk, rst, din,
    output reg dout
);

    parameter idle = 2'b00;
    parameter s0   = 2'b01;
    parameter s1   = 2'b10;

    reg [1:0] state;

    // Single Sequential Process
    always @(posedge clk) begin
        if (rst == 1'b1) begin
            state <= idle;
            dout  <= 1'b0;
        end else begin
            case (state)
                idle: begin
                    dout  <= 1'b0;
                    state <= s0;
                end

                s0: begin
                    dout <= 1'b0;
                    if (din == 1'b1)
                        state <= s1;
                    else
                        state <= s0;
                end

                s1: begin
                    dout <= 1'b1;
                    if (din == 1'b1)
                        state <= s0;
                    else
                        state <= s1;
                end

                default: begin
                    state <= idle;
                    dout  <= 1'b0;
                end
            endcase
        end
    end

endmodule