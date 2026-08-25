`timescale 1ns / 1ps


module down_counter(
    input  wire clk,
    input  wire reset,
    input  wire  load,
    input  wire [3:0] load_data,
    output reg  [3:0] count
);

    always @(posedge clk) begin
        if (reset) begin
            count <= 4'b0000;
        end
        else if (load) begin
            count <= load_data;
        end
        else begin
            count <= count - 1'b1;
        end
    end

endmodule