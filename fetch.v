module Fetch(clk, sl2, PCSrc, ins);

input clk, PCSrc;
input [31:0] sl2;
output [31:0] ins;
wire [9:0] inPC, outAd, res, res2;
reg reset;

ProgramCounter pc1(clk , reset, inPC, outAd);
add a1(outAd, 10'd4, res);
addj a2(res, sl2, res2);
mux10 m10(res, res2, PCSrc, inPC);
InstructionMemory im1(clk, outAd, ins);

initial
	reset = 1'b0;

endmodule
