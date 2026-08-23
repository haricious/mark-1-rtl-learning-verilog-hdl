`timescale 1ns / 1ps

module fsm(
    input clk, rst, din,
    output reg dout
);
    
    parameter idle = 2'b00;
    parameter s0   = 2'b01;
    parameter s1   = 2'b10;
    
    reg [1:0] state, nstate;
    
    // 1. Reset and state transition logic (Sequential)
    always @(posedge clk) begin
        if (rst == 1'b1)
            state <= idle;
        else
            state <= nstate;
    end 
    
    // 2. Next state logic (Combinational)
    always @(*) begin
        case (state)
            idle: nstate = s0;
            
            s0: begin
                if (din == 1'b1)
                    nstate = s1;
                else   
                    nstate = s0;
            end
            
            s1: begin
                if (din == 1'b1)
                    nstate = s0;
                else
                    nstate = s1;
            end
            
            default: nstate = idle;
        endcase
    end
    
    // 3. Output logic (Combinational)
    always@(state) begin
    case(state)
        idle: dout =1'b0;
        s0: dout =1'b0;
        s1: dout = 1'b1;
    default: dout=idle;
    endcase
    end
    
    
endmodule