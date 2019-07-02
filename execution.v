module Execution(clk);

input clk;
wire [3:0] operation, ALUOpFinal;

wire [31:0] ins;
wire RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Inm;
wire [1:0] ALUOp;
wire [4:0] WRegister;
wire [31:0] WData, RData1, RData2, res_se, res_sl, val2, aluresult, RDataDM;
wire zero, overflow, carry;

Fetch f1(clk, res_sl, Branch, ins);
control c1(clk, ins[31:26], RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, ALUOpFinal, Inm);
mux5 swreg(ins[20:16], ins[15:11], RegDst, WRegister);
registerFile r1(clk, ins[25:21], ins[20:16], WRegister, WData, RData1, RData2, RegWrite);
SignExtend se(ins[15:0], res_se);
ShiftLeft sl(res_se, res_sl);
mux32 alusrc(clk, RData2, res_se, ALUSrc, val2);
alu a1(RData1, val2, operation, zero, aluresult, overflow, carry);
AluControl ac1(ALUOp, ins[5:0], Inm, ALUOpFinal, operation);
DataMemory dm(clk, aluresult, RData2, MemWrite, MemRead, RDataDM);
mux32 mtorg(clk, aluresult, RDataDM, MemtoReg, WData);


initial
	//$monitor($time,"ins: %b alu1: %d, alu2: %d, res: %d, op: %b",ins, RData1, val2, aluresult, operation); 
	$monitor($time," %b ins: %b, %d, %d, %d, %b",clk,ins, RData1, val2, aluresult, operation);

endmodule
