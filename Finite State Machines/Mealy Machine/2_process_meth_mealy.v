`timescale 1ns / 1ps

module fsm(
    input clk, din, rst,
    output reg dout
);

    parameter idle = 2'b00;
    parameter s0   = 2'b01;
    parameter s1   = 2'b10;

    reg [1:0] state = idle, nstate = idle;

    // Reset and State Register Logic (Sequential)
    always @(posedge clk) begin
        if (rst == 1'b1)
            state <= idle;
        else
            state <= nstate;
    end

    // Next State Logic + Output Logic (Combinational)
    always @(*) begin
        dout = 1'b0;
        
        case (state)
            idle: begin
                nstate = s0;
            end
            
            s0: begin
                if (din == 1'b1) begin
                    nstate = s1;
                    dout   = 1'b1; // Output depends on input din
                end else begin
                    nstate = s0;
                    dout   = 1'b0;
                end
            end
            
            s1: begin
                if (din == 1'b1) begin
                    nstate = s0;
                    dout   = 1'b0;
                end else begin
                    nstate = s1;
                    dout   = 1'b0;
                end
            end
            
            default: begin
                nstate = idle;
                dout   = 1'b0;
            end
        endcase
    end

endmodule