module fadd( 
    input a, b, cin,
    output cout, sum );
    
    assign sum = a^b^cin;
    assign cout = ((a&b)|(cin&(a^b)));

endmodule

module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    
    wire w1, w2;
    
    fadd f1(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(w1));
    fadd f2(.a(a[1]), .b(b[1]), .cin(w1), .sum(sum[1]), .cout(w2));
    fadd f3(.a(a[2]), .b(b[2]), .cin(w2), .sum(sum[2]), .cout(cout[2]));
   
    assign cout[0] = w1;
    assign cout[1] = w2;
    

endmodule
