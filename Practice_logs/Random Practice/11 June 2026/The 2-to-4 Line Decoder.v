// Build a combinational 2-to-4 line decoder. It takes a 2-bit input binary code and activates exactly one of the four single-bit outputs (`y0`, `y1`, `y2`, `y3`)
module the_2_to_4_decoder(
    input  [1:0] in,
    output reg [3:0] y
);

always @(*) begin
    case(in)
        2'b00: y = 4'b0001;
        2'b01: y = 4'b0010;
        2'b10: y = 4'b0100;
        2'b11: y = 4'b1000;
        default: y = 4'b0000;
    endcase
end

endmodule
