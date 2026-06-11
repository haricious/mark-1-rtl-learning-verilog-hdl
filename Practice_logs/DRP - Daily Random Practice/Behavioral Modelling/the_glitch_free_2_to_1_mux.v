// Write a combinational block that models a simple 2-to-1 Multiplexer with inputs `a`, `b`, and a select signal `sel`

module the_glitch_free_2_to_1_mux (
    input wire a,
    input wire b,
    input wire sel,
    output reg out
);

always @(*) begin
    case(sel)
        1'b0: out = a;
        default: out = b;
    endcase
end

endmodule