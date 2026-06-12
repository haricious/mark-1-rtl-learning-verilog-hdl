`timescale 1ns / 1ps


module or_gate(
input a,b,
output y
    );
    
    wire w1;
    wire w2;
    
    supply0 gnd;
    supply1 vdd;
    
    pmos p1(w1, vdd, a);
    pmos p2(w2, w1, b);
    pmos p3(y, vdd, w2);
    
    nmos n1(w2, gnd, a);
    nmos n2(w2, gnd, b);
    nmos n3(y, gnd, w2);
endmodule
