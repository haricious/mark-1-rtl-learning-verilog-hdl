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


// testbench 

`timescale 1ns / 1ps

module tb_down_counter;

    reg clk;
    reg reset;
    reg load;
    reg  [3:0] load_data;
    wire [3:0] count;

    down_counter_4bit uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .load_data(load_data),
        .count(count)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 0;
        load = 0;
        load_data = 4'b0000;

        #2;
        reset = 1;
        #10;
        reset = 0;

        #30;

        load_data = 4'b1100;
        load = 1;
        #10;
        load = 0;
        #40;

        load_data = 4'b0101;
        load = 1;
        reset = 1;
        #10;
        reset = 0;
        load = 0;

        #20;
        $finish;
    end

    initial begin
        $monitor("Time=%0t ns | Reset=%b | Load=%b | Load_Data=%b | Count=%b",
                 $time, reset, load, load_data, count);
    end

endmodule
