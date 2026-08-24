`timescale 1ns / 1ps

// 1. tb has no i/o ports
// 2. i/p of dut is always a reg type. 
// 3. o/p of dut is always a wire type.
module tb;

    reg clk=0;
    
    initial begin
        clk=0; end
        always #5 clk=~clk;
    initial begin
    #500
    $finish;
    end
    
endmodule
