module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire w1;
    wire [31:0] w2;
    
    assign w2 = b ^ {32{sub}};
    
    add16 subt(.a(a[15:0]), .b(w2[15:0]), .cin(sub), .cout(w1), .sum(sum[15:0]));
    add16 add(.a(a[31:16]), .b(w2[31:16]), .cin(w1), .cout(), .sum(sum[31:16]));
    
endmodule