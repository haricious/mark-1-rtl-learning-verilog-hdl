`timescale 1ns / 1ps

module tb_ring_count();

reg clk, rst;
wire [3:0]q;

ring_count dut(clk, rst,q);

always #5 clk=~clk;

initial begin
clk=0;
rst=1;
#50;
rst = 0;
end

initial begin
    $monitor("Time=%0t, rst=%b, q=%b", $time, rst, q);
end



endmodule