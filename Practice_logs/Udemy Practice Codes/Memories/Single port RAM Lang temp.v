/* Lnaguage template for a Dist. Ram in Verilog
   This template can be used to create a single-port RAM with the specified parameters.
   parameter RAM_WIDTH = <ram_width>;
   parameter RAM_ADDR_BITS = <ram_addr_bits>;

   (* ram_style="distributed" *)
   reg [RAM_WIDTH-1:0] <ram_name> [(2**RAM_ADDR_BITS)-1:0];

   wire [RAM_WIDTH-1:0] <output_data>;

   <reg_or_wire> [RAM_ADDR_BITS-1:0] <read_address>, <write_address>;
   <reg_or_wire> [RAM_WIDTH-1:0] <input_data>;

   always @(posedge <clock>)
      if (<write_enable>)
         <ram_name>[<write_address>] <= <input_data>;

   assign <output_data> = <ram_name>[<read_address>]; 

*/
					
`timescale 1ns / 1ps


module ram(
input clk,
input we,
input [5:0]addr,
input [7:0]din,
output [7:0]dout
    );
    
    reg [7:0]mem[63:0];
always @(posedge clk)begin
      if (we)
         mem[addr] <=din;     
end

   assign dout = mem[addr];
endmodule
