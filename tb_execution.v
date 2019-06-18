module tb;
reg clk;

Execution e1(clk);

initial begin
	clk = 0;
	#1000
	$finish;
end

always
	#10 clk = !clk;

endmodule
