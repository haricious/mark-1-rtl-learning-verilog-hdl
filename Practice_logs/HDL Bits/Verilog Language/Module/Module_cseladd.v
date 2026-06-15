module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    
    wire sel;
    wire [15:0] sum_cin0;
    wire [15:0] sum_cin1;

    add16 lower_adder (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum[15:0]),
        .cout(sel)
    );

    add16 upper_adder_0 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(sum_cin0),
        .cout()
    );

    add16 upper_adder_1 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(sum_cin1),
        .cout()
    );

    assign sum[31:16] = (sel) ? sum_cin1 : sum_cin0;

endmodule