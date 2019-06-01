module Fetch(clk, ins);

input clk;
output [31:0] ins;
wire [9:0] inPC, outAd;
reg res;

ProgramCounter pc1(clk , res, inPC, outAd);
add a1(outAd, 10'd4, inPC);
InstructionMemory im1(clk, outAd, ins);

initial
	res = 1'b0;

endmodule
