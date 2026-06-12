`timescale 1ns / 1ps


module nand2(
input a, b,
output out
    );
    
    wire w1;
    
    supply1 vdd;
    supply0 gnd;
    
    pmos p1(out, vdd, a);
    pmos p2(out, vdd, b);
    
    nmos n1(out, w1, a);
    nmos n2(w1, gnd, b);
endmodule
