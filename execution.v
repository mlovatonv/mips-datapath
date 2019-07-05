module Execution(clk);

input clk;
wire [0:3] operation, ALUOpFinal;

wire [0:31] ins;
wire RegDst, Branch, MemtoReg, ALUSrc, RegWrite, Inm;
wire [0:1] ALUOp, MemRead, MemWrite;
wire [0:4] WRegister;
wire [0:31] WData, RData1, RData2, res_se, res_sl, val2, aluresult, RDataDM;
wire zero, overflow, carry;

Fetch f1(clk, res_sl, Branch, ins);
control c1(clk, ins[0:5], RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, ALUOpFinal, Inm);
mux5 swreg(clk, ins[11:15], ins[16:20], RegDst, WRegister);
registerFile r1(clk, ins[6:10], ins[11:15], WRegister, WData, RData1, RData2, RegWrite);
SignExtend se(ins[16:31], res_se);
ShiftLeft sl(res_se, res_sl);
mux32 alusrc(clk, RData2, res_se, ALUSrc, val2);
AluControl ac1(clk,ALUOp, ins[26:31], Inm, ALUOpFinal, operation);
alu a1(clk,RData1, val2, operation, zero, aluresult, overflow, carry);
DataMemory dm(clk, aluresult, RData2, MemWrite, MemRead, RDataDM);
mux32 mtorg(clk, aluresult, RDataDM, MemtoReg, WData);


initial
	//$monitor($time,"ins: %b alu1: %d, alu2: %d, res: %d, op: %b",ins, RData1, val2, aluresult, operation); 
	$monitor($time," %b ins: %h %d, %d %d %d %d %h %h",clk, ins, RData1, val2, operation, aluresult, MemRead, WData, RData2);

endmodule
