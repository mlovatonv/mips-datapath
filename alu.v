module alu(clk,Reg1, Reg2, operation, zero, result, overflow, carry);

input clk;
input [0:31] Reg1, Reg2;
input [0:3] operation;

output zero, overflow, carry;
output [0:31] result;

reg [0:32] res;

always @(*)
begin
	case(operation)
        	4'b0000 : res = (Reg1&Reg2);
	        4'b0001 : res = Reg1|Reg2;
	        4'b0010 : res = Reg1 + Reg2;
	        4'b0110 : res = Reg1 - Reg2;
	        4'b0111 : res = Reg1 < Reg2;
	        4'b1100 : res = ~(Reg1 | Reg2);
	endcase
end

assign zero = res == 0;
assign carry = res[0];
assign overflow = carry;
assign result = res[1:32];

endmodule

