module dp(clk, Read1, Read2, Write, op, zero, overflow, carry, inm, sel, Data);

wire[31:0] ReD1, ReD2, res_m;
output wire[31:0] Data;

input clk, sel;
input [4:0] Read1, Read2, Write;
input [3:0] op;
input [15:0] inm;
output zero, overflow, carry;

registerFile rf1(clk, Read1, Read2, Write, Data, ReD1, ReD2);
alu a1(clk, ReD1, res_m, op, zero, Data, overflow, carry);
mux m1(ReD2, inm, sel, res_m);



endmodule
