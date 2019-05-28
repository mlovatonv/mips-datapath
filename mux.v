module mux(Reg1, Reg2, sel, out);

input sel;
input [31:0] Reg1;
input [15:0] Reg2;
output [31:0] out;

assign out = sel == 0? Reg1:
	sel ==1? Reg2 : 0;

endmodule
