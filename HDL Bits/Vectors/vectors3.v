// concatenate 5 5-bit inputs and 2 1-bit inputs to form 4 8-bit outputs. The last 2 bits of the concatenation are always 1.
module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );//

    assign {w, x, y, z} = {a, b, c, d, e, f, 2'b11};

endmodule

