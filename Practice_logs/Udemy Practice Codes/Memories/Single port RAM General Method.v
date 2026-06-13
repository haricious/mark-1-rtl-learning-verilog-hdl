`timescale 1ns / 1ps


module ram(
input clk,
input rst,
input we,
input [5:0]addr,
input [7:0]din,
output [7:0]dout
    );
    
    reg [7:0]mem[63:0];
    reg [7:0] temp;
    integer i = 0;
    
    always @(posedge clk) begin
    if(rst==1'b1) begin
        for(i=0;i<64;i=i+1) begin
        mem[i] <= 8'h00;
        temp <= 8'h00;
        end
    end
    
    else begin
        if(we==1'b1) begin
        
        mem[addr] <= din;
        end
        else 
            temp <= mem[addr];
    end
    end
    
    
    assign dout = temp;
endmodule
