`timescale 1ns / 1ps

module mux(
    input a,b,c,d,
    input[3:0]sel,
    output reg x,y,z
    );
    
    always@(*)
    begin
    case(sel)
    4'b0000: x=a;
    default: x=b;
    endcase
    case(sel)
    4'b0000: y=c;
    default: y = d;
    endcase
    case(sel)
    4'b0000: z=x;
    default: z=y;
    endcase
    end
    
endmodule
