module Fetch(clk, sl2, PCSrc, ins);

input clk, PCSrc;
input [31:0] sl2;
output [31:0] ins;
wire [9:0] inPCo, outAd, res, res2;
reg [9:0] inPC;
reg reset;

ProgramCounter pc1(clk , reset, inPC, outAd);
add a1(outAd, 10'd4, res);
addj a2(res, sl2, res2);
mux10 m10(clk, res, res2, PCSrc, inPCo);
InstructionMemory im1(clk, outAd, ins);

initial
	reset = 1'b0;

initial
	inPC = 0;

//always
//	#10 $display("%b dat: %b %b %b %b %b %b %b %b\n", clk, reset, inPC, outAd, res, sl2, res2, PCSrc, ins);

always
	#5 assign inPC = inPCo;

endmodule
/*
module tb;
reg clk, PCSrc;
reg [31:0] sl2;
wire [31:0] ins;

Fetch f(clk, sl2, PCSrc, ins);

initial begin
	clk = 0;
	PCSrc = 0;
	sl2 = 0;
	#100
	$finish;
end

always
	#10 clk = ! clk;

endmodule*/
