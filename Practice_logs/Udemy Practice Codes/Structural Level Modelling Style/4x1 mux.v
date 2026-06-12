`timescale 1ns / 1ps

module mux21(
input a,b,
input sel,
output y);

assign y = (sel == 1'b0) ? a:b;

endmodule


module mux41(
input i0,i1,i2,i3,
input [1:0]s, 
output f);

wire w1,w2;
mux21 m1(i0, i1, s[0], w1);

mux21 m2(i2, i3, s[0], w2);

mux21 m3(w1, w2, s[1], f);


endmodule
