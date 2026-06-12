`timescale 1ns / 1ps

module and_gate(
input a,b,
output out
);
 
supply1 vdd;
supply0 gnd;
wire w1;
wire w2;
 
pmos p1 (w2, vdd, a);
pmos p2 (w2, vdd, b);
 
nmos n1 (w2, w1, a);
nmos n2 (w1, gnd, b);
 
pmos p3 (out, vdd, w2);
nmos n3 (out , gnd, w2);
endmodule
