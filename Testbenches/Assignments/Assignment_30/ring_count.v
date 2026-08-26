module ring_count(
    input clk, rst,
    output reg [3:0] q
);


always@(posedge clk) begin
    if(rst==1'b1)
        q <= 4'b1000;
    else
        q <= {q[0], q[3:1]};
end

endmodule