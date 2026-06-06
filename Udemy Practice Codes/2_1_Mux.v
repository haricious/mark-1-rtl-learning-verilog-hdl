`timescale 1ns / 1ps

module mux(
    input a,b,sel,
    output reg x
);

always@(*)
    begin
    if(sel==1'b0)
       x=a;
    else
       x=b;
    end

endmodule