`timescale 1ns/1ps

module tb_dmux();

    reg i;
    reg [1:0] sel;
    wire [3:0] y;

    dmux dut (
        .i(i),
        .sel(sel),
        .y(y)
    );

    initial begin
        i = 0;
        sel = 2'b00;

        #10;
        i = 1;
        sel = 2'b00;

        #20;
        sel = 2'b01;

        #30;
        sel = 2'b10;

        #40;
        sel = 2'b11;

        #50;
        i = 0;

        #100;
        $finish;
    end

endmodule