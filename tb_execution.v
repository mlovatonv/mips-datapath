module tb;
reg clk, reset;

Execution e1(clk, reset);

initial begin
	clk = 0;
	reset = 0;
	#310
	$finish;
end

always
	#10 clk = !clk;

endmodule
