module alu(Reg1, Reg2, operation, zero, result, overflow, carry);

input [31:0] Reg1, Reg2;
input [3:0] operation;

output zero, overflow, carry;
output [31:0] result;

reg [32:0] res;

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
assign carry = res[32];
assign overflow = carry;
assign result = res[31:0];

endmodule

