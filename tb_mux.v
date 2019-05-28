module tb;
reg [31:0] Reg1;
reg [15:0] Reg2;
reg sel;
wire [31:0] out;
mux m1(Reg1, Reg2, sel, out);

initial
begin
	Reg1 = 10;
	Reg2 = 20;
	sel = 1'b0;
	#20
	sel = 1'b1;
	#10
	$finish;
end

initial
	$monitor("sel: %b, out: %b \n", sel, out);
endmodule
