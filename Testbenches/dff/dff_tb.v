module dff_tb;

reg clk,din;
wire q,qbar;
integer i=0;

initial begin
clk=0;
din=0;
end

always #10 clk=~clk;

dff dut(clk, din, q, qbar);
initial begin
for(i=0;i<20;i=i+1) begin
    din=$urandom();
    #10;
    $display("Value of din: %0d and q=%0d and qbar=%0d", din,q,qbar);
end

end
initial begin
#500;
$finish;
end
endmodule