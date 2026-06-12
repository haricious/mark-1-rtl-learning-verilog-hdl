// Design 4-bit Ripple Carry Adder with the help of 1-bit adder

`timescale 1ns / 1ps

module fa(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

assign sum = a ^ b ^ cin;
assign cout = (a & b) | (b & cin) | (a & cin);

endmodule

module ripple_carry_adder(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
);

wire w0, w1, w2;

fa fa1(a[0], b[0], cin, sum[0], w0);
fa fa2(a[1], b[1], w0,  sum[1], w1);
fa fa3(a[2], b[2], w1,  sum[2], w2);
fa fa4(a[3], b[3], w2,  sum[3], cout);

endmodule