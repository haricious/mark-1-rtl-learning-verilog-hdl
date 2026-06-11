`timescale 1ns / 1ps


module dff(
    input din,
    input clk,
    input rst_sync,
    input rst_async,
    output reg q, qbar
    );
    
    always@(posedge clk or posedge rst_async)
    begin
    if(rst_async==1'b1)
        begin
        q <= 1'b0;
        qbar <= 1'b1;
        end
     else if(rst_sync==1'b1)
        begin
        q <= 1'b0;
        qbar <= 1'b1;
        end
    else
        begin
        q <= din;
        qbar <= ~din;
        end
    end
endmodule
