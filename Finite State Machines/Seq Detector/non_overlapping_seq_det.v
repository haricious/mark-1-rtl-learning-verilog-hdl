`timescale 1ns / 1ps

module fsm(
    input clk, rst, din,
    output reg dout);
    
    parameter idle=2'b00;
    parameter s0=2'b01;
    parameter s1=2'b10;
    parameter s2=2'b11;
    
    reg [1:0]state=idle;
    
    // 1 process methodology
    always@(posedge clk) begin
    case(state)
        idle: begin
            dout<=1'b0;
            if(rst==1'b1)
                state<=idle;
            else
                state<=s0;
            end
        s0: begin
            if(din==1'b1)begin
                state<=s1;
                dout<=1'b0;
            end
            else begin
                state<=s0;
                dout<=1'b0;       
            end
            end
        s1: begin
            if(din==1'b1)begin
                state<=s2;
                dout<=1'b0;
            end
            else begin
                state<=s0;
                dout<=1'b0;       
            end
            end
        s2: begin
            if(din==1'b1)begin
                state<=s0;
                dout<=1'b1;
            end
            else begin
                state<=s0;
                dout<=1'b0;       
            end
            end               
    
    default: begin
        state<=idle; 
        dout<=1'b0;
    end
    endcase
     
     
     end
   

endmodule