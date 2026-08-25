module Mux_tb;

reg a,b,sel;
wire y;

initial begin
a=0;
b=0;
sel=0;
end

Mux dut (a,b,sel,y);

always #10 a=~a;
always #20 b=~b;
always #30 sel=~sel;

initial begin
#500;
$finish;
end
endmodule