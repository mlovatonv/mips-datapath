module Fetch(clk, in1, out1, ins);

input clk;
output [9:0] out1;
output reg [9:0]in1;

output [31:0] ins;

wire [9:0]in2, out2, out3;
reg [9:0]c1;
reg res;

ProgramCounter pc1(clk, res, in1, out1);
InstructionMemory im1(out1, ins);
add a1(out1, c1, out2 );

initial
begin
	res = 0;
	in1 = 2;
	c1 = 4;
end

always@(posedge clk)
begin
	assign in1 = out2;
end

endmodule

