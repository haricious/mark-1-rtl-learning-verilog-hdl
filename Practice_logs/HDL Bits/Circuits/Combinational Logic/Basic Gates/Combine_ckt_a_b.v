module top_module (
    input x,
    input y,
    output z
);

    wire w1, w2, w3, w4;
    
    A IA1 (.x(x), .y(y), .z(w1));
    B IB1 (.x(x), .y(y), .z(w3));
    A IA2 (.x(x), .y(y), .z(w2));
    B IB2 (.x(y), .y(x), .z(w4));
    
    assign z = ((w1 | w3) ^ (w2 & w4));

endmodule

module A (
    input x,
    input y,
    output z
);
    assign z = (x ^ y) & x;
endmodule

module B (
    input x,
    input y,
    output z
);
    assign z = (x == y);
endmodule