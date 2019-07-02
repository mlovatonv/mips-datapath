module Fetch(clk, sl2, PCSrc, ins);

input clk, PCSrc;
input [31:0] sl2;
output [31:0] ins;
wire [31:0] inPCo, outAd, res, res2;
wire [31:0] inPC;
reg reset;

ProgramCounter pc1(clk , reset, inPC, outAd);
add a1(outAd, 32'd4, res);
add a2(res, sl2, res2);
mux32 m(clk, res, res2, PCSrc, inPC);
InstructionMemory im1( outAd, ins);

initial begin
	//reset = 1'b1;
	reset = 1'b1;
	#30 reset = 1'b0;
end

//initial
//	inPC = 0;

//initial
//	$monitor($time," %b dat:%d %d %d %d\n", clk,inPC, outAd, res, res2);

//always
//	#5 assign inPC = inPCo;

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
