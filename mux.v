module mux32(Reg1, Reg2, sel, out);

input sel;
input [31:0] Reg1;
input [31:0] Reg2;
output [31:0] out;

assign out = sel == 0? Reg1:
        sel ==1? Reg2 : 0;
endmodule

module mux5(Reg1, Reg2, sel, out);

input sel;
input [4:0] Reg1;
input [4:0] Reg2;
output [4:0] out;

assign out = sel == 0? Reg1:
        sel ==1? Reg2 : 0;
endmodule

module mux10(Reg1, Reg2, sel, out);

input sel;
input [9:0] Reg1, Reg2;
output [9:0] out;

assign out = sel == 0? Reg1:
	sel ==1? Reg2 : 0;

endmodule
