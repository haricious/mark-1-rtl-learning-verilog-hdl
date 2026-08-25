module bin_to_ex_tb;

reg [3:0]a=0;
wire [4:0]y;
integer i=0;
bin_to_ex dut(a,y);
initial begin
for(i=0;i<20;i=i+1) begin

    a=$urandom();

end
end
initial begin
#500;
$finish;
end
endmodule