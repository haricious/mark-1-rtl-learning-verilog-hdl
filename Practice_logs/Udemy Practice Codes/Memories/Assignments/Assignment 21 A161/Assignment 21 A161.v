// Generate Half Wave rectifier signal using Single Port ROM.
`timescale 1ns / 1ps


module hwr_rom(
input clk, 
input [9:0]addr,
input en,
output [7:0]dout
    );
    
    blk_mem_gen_1 brom(clk, en, addr, dout);
endmodule
