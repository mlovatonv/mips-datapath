module mux32(clk, Reg1, Reg2, sel, out);

input sel, clk;
input [0:31] Reg1;
input [0:31] Reg2;
output reg[0:31] out;

always @ (*) begin
	 out = sel == 0? Reg1:
	 sel ==1? Reg2 : 0;
end
endmodule

module mux32v(clk, Reg1, Reg2, sel, out);

input sel, clk;
input [0:31] Reg1;
input [0:31] Reg2;
output reg[0:31] out;

always @ (posedge clk) begin
	 out = sel == 0? Reg1:
	 sel ==1? Reg2 : 0;
end
endmodule

module mux5(clk, Reg1, Reg2, sel, out);

input sel, clk;
input [0:4] Reg1;
input [0:4] Reg2;
output reg[0:4] out;

always @ (*) begin
	out = sel == 0? Reg1:
        sel ==1? Reg2 : 0;
end
endmodule

module mux10(clk, Reg1, Reg2, sel, out);

input sel, clk;
input [0:9] Reg1, Reg2;
output reg [0:9] out;

always @(*) begin
	 out = sel == 0? Reg1:
	sel ==1? Reg2 : 0;
end

endmodule

module mux_tri(clk, Reg1, Reg2, Reg3, sel, out);

input clk;
input [0:1] sel;
input [0:4] Reg1, Reg2;
input [0:31] Reg3;
output reg [0:31]out;

always @(*) begin
	out = sel == 0? Reg1:
	sel == 1? Reg2:
	sel == 2? Reg3 : 0;
end

endmodule

module mux32tri (clk, Reg1, Reg2, Reg3, sel, out);

input clk;
input [0:1] sel;
input [0:31] Reg1, Reg2, Reg3;
output reg [0:31] out;

always @(*) begin
	out = sel == 0? Reg1:
	sel == 1? Reg2:
	sel == 2? Reg3 : 0;
end

endmodule