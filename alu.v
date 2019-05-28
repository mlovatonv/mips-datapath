module alu(clk, Reg1, Reg2, op, zero, result, overflow, carry);

input clk;
input [31:0] Reg1, Reg2;
input [3:0] op;

output reg zero, overflow, carry;
output reg [31:0] result;

reg [32:0] res;

always @(posedge clk)

begin

case(op)
	4'b0000 : res = (Reg1&Reg2);
	4'b0001 : res = Reg1|Reg2;
	4'b0010 : res = Reg1 + Reg2;
	4'b0110 : res = Reg1 - Reg2;
	4'b0111 : res = Reg1 < Reg2;
	4'b1100 : res = ~(Reg1 | Reg2);
endcase

zero = res == 0;
carry = res[32];
overflow = carry;
result = res[31:0];

end

endmodule
