module tb;

reg clk;
wire [9:0] in, in2;
wire [31:0] ins;

Fetch f1(clk, in, in2, ins);

initial
begin
	clk = 1'b0;
	#300
	$finish;
end

always
	#10 clk = !clk;

initial begin
	$monitor($time," valor de pc: %d - %d, ins = %b\n", in, in2, ins);
end

endmodule
