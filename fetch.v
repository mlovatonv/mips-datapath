module Fetch(clk, sl2, PCSrc, ins);

input clk, PCSrc;
input [0:31] sl2;
output [0:31] ins;
wire [0:31] inPCo, outAd, res, res2;
wire [0:31] inPC;
reg reset;

ProgramCounter pc1(clk , reset, inPC, outAd);
add a1(clk, outAd, 32'd4, res);
add a2(clk, res, sl2, res2);
mux32v m(clk, res, res2, PCSrc, inPC);
InstructionMemory im1(clk, outAd, ins);

initial begin
	//reset = 1'b1;
	reset = 1'b0;
	//#30 reset = 1'b0;
end

//initial
//	inPC = 0;

//initial
//	$monitor($time," %b dat: %d, %h\n", clk, outAd, ins);

//always
//	#5 assign inPC = inPCo;

endmodule
/*
module tb;
reg clk, PCSrc;
reg [0:31] sl2;
wire [0:31] ins;

Fetch f(clk, sl2, PCSrc, ins);

initial begin
	clk = 0;
	PCSrc = 0;
	sl2 = 0;
	#150
	$finish;
end

always
	#10 clk = ! clk;

endmodule*/
