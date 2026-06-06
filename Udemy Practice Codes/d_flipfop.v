`timescale 1ns / 1ps


module dff(
    input Din, clk,
    output reg Q, Qbar
    );
    
    always@(posedge clk)
    begin
    Q <= Din;
    Qbar <= ~Din;
    end
endmodule
