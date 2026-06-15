// Design 8:1 Mux using 4:1 Mux

module mux41(
    input  a,b,c,d,
    input  s0,s1,
    output reg Y
);

always @(*) begin
    case ({s0,s1})
        2'b00: Y = a;
        2'b01: Y = b;
        2'b10: Y = c;
        2'b11: Y = d;
        default: Y = 1'b0;
    endcase
end

endmodule

module mux21(
    input a,b,
    input s2,
    output y
);
assign y = s2 ? b : a;
endmodule
