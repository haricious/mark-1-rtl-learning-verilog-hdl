`timescale 1ns / 1ps

module dff(
    input clk, din,
    output reg q, qbar
);

always@(posedge clk) begin

    q<=din;
    qbar<=~din;

end


endmodule