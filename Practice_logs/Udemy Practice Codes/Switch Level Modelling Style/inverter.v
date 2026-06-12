`timescale 1ns / 1ps

module inverter(
input wire vin,
output vout
    );
   
    supply1 vdd;
    supply0 gnd;
    
    pmos p1(vout, vdd, vin);
    nmos n1(vout, gnd, vin);
    
    
    
endmodule
