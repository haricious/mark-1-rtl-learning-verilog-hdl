`timescale 1ns / 1ps

module bin_to_ex(
    input [3:0] a,
    output reg [5:0]y
    );
    
    always@(*) begin
    y={1'b0,a}+5'b00011;
    
    end



endmodule