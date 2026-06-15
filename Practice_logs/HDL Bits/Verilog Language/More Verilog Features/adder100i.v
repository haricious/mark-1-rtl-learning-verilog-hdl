/*
Create a 100-bit binary ripple-carry adder by instantiating 100 full adders. 
(You also need to write the full adder module, possibly by reusing your solution to fadd.)

The adder adds two 100-bit numbers and a carry-in to produce a 100-bit sum and carry out. 
To encourage you to actually instantiate full adders, also output the carry-out from each full adder in the ripple-carry adder. 
cout[99] is the final carry-out from the last full adder, and is the carry-out you usually see.
*/

module top_module( 
    input [99:0] a,
    input [99:0] b,
    input cin,
    output [99:0] sum,
    output [99:0] cout
);

    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : adder_loop
            if (i == 0) begin
                fadd fa (
                    .a(a[i]),
                    .b(b[i]),
                    .cin(cin),
                    .sum(sum[i]),
                    .cout(cout[i])
                );
            end else begin
                fadd fa (
                    .a(a[i]),
                    .b(b[i]),
                    .cin(cout[i-1]),
                    .sum(sum[i]),
                    .cout(cout[i])
                );
            end
        end
    endgenerate 