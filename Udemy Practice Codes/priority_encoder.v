`timescale 1ns / 1ps

module priority_encoder(
    input [7:0] y,
    output reg a, b, c, d
    );
    
    always @(*) begin
        a = 1'b0;
        b = 1'b0; 
        c = 1'b0; 
        d = 1'b1; 

        casex(y)
            8'b1xxxxxxx: {a, b, c} = 3'b111;
            8'b01xxxxxx: {a, b, c} = 3'b110; 
            8'b001xxxxx: {a, b, c} = 3'b101;
            8'b0001xxxx: {a, b, c} = 3'b100; 
            8'b00001xxx: {a, b, c} = 3'b011;
            8'b000001xx: {a, b, c} = 3'b010; 
            8'b0000001x: {a, b, c} = 3'b001; 
            8'b00000001: {a, b, c} = 3'b000; 
                
            default: begin
                {a, b, c} = 3'b000;
                d = 1'b0; 
            end
        endcase
    end
endmodule