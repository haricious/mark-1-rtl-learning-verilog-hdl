`timescale 1ns / 1ps


module counter(
    input clk,rst,
    output reg [3:0]dout
    );
    
    always@(posedge clk) begin
        if(rst==1'b1)
            dout<=0;
        else
            dout<=dout+1;

    end
endmodule
