`timescale 1ns / 1ps

module Mux(
    input a,b,
    input sel, 
    output reg y
);

always@(*) begin

    y = sel?a:b;

end


endmodule