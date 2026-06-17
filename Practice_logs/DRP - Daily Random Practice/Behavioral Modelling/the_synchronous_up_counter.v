//  Design a 4-bit counter that increments by 1 on every positive edge of the clock. It must include a synchronous active-high reset signal (`rst`) that forces the counter back to `4'b0000`

module the_synchronous_up_counter (
    input wire clk,
    input wire rst,
    output reg [3:0] count
);
 