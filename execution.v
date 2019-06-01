module Execution(clk, operation);

input clk;
input [3:0] operation;

wire [31:0] ins;
wire RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite;
wire [4:0] WRegister;
wire [31:0] WData, RData1, RData2, res_se, val2;
wire zero, overflow, carry;

Fetch f1(clk, ins);
control c1(clk, ins[31:26], RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
mux5 swreg(ins[20:16], ins[15:11], RegDst, WRegister);
registerFile r1(clk, ins[25:21], ins[20:16], WRegister, WData, RData1, RData2, RegWrite);
SignExtend se(ins[15:0], res_se);
mux32 alusrc(RData2, res_se, ALUSrc, val2);
alu a1(RData1, val2, operation, zero, WData, overflow, carry);


endmodule
