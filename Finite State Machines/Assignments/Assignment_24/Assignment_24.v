`timescale 1ns / 1ps

module fsm(
    input clk, rst, din,
    output reg dout
);

    parameter idle = 3'b000;
    parameter s0   = 3'b001;
    parameter s1   = 3'b010;
    parameter s2   = 3'b011;
    parameter s3   = 3'b100;
    parameter s4   = 3'b101;

    reg [2:0] state, nstate; 

    // 1. Reset block
    always @(posedge clk) begin
        if (rst == 1'b1)
            state <= idle;
        else
            state <= nstate;
    end

    // 2. Combinational Next-State & Output Logic
    always @(*) begin

        nstate = state;
        dout   = 1'b0;

        case (state)
            idle: begin
                if (din == 1'b1)
                    nstate = idle;
                else
                    nstate = s0;
            end

            s0: begin
                if (din == 1'b1)
                    nstate = s1;
                else
                    nstate = s0;
            end

            s1: begin
                if (din == 1'b1)
                    nstate = s1;
                else
                    nstate = s2;
            end

            s2: begin
                if (din == 1'b1)
                    nstate = s1;
                else
                    nstate = s3;
            end

            s3: begin
                if (din == 1'b1) begin
                    nstate = s4;
                    dout   = 1'b1; // Sequence detected!
                end else begin
                    nstate = s0;
                end
            end

            s4: begin
                if (din == 1'b1)
                    nstate = s1;
                else
                    nstate = s0;
            end

            default: begin
                nstate = idle;
                dout   = 1'b0;
            end
        endcase
    end

endmodule