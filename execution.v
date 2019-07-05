module Execution(clk, reset);

input clk, reset;
wire [0:3] operation, ALUOpFinal;

wire [0:31] ins;
wire Branch, RegWrite, Inm, mBranch, Jump, negzero, lui;
wire [0:1] ALUOp, MemRead, MemWrite, RegDst, MemtoReg, ALUSrc;
wire [0:31] WRegister;
wire [0:31] WData, RData1, RData2, res_se, res_sl, val2, aluresult, RDataDM;
wire zero, overflow, carry, jr, zeroresult;
wire [0:31] inPC, outAd, res, res2, res_jump, res_jump2, res_jump3, res_branch, res_branch2, alui, blui;

//Fetch f1(clk, res_sl, Branch, ins);
ProgramCounter pc1(clk , reset, inPC, outAd);
add ad1(clk, outAd, 32'd4, res);
add ad2(clk, res, res_sl, res2);
xor xor1(zeroresult, zero, negzero);
and and1(mBranch, Branch, zeroresult);
mux32v m(clk, res, res2, mBranch, res_branch);
InstructionMemory im1(clk, outAd, ins);
SignExtend26 se26(ins[6:31], res_jump);
ShiftLeft sl2(res_jump, res_jump2);
addjump addj(res_jump2, res, res_jump3);
mux32 muxjump(clk, res_branch, res_jump3, Jump, res_branch2);
mux32 muxjr (clk, res_branch2, RData1,jr, inPC);
jregister jreg(ins[26:31], jr);
 //end jumps
control c1(clk, ins[26:31], ins[0:5], RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, ALUOpFinal, Inm, Jump, negzero, lui);
mux_tri swreg(clk, ins[11:15], ins[16:20], 32'd31, RegDst, WRegister);
registerFile r1(clk, ins[6:10], ins[11:15], WRegister, WData, RData1, RData2, RegWrite);
SignExtend se(ins[16:31], res_se);
ShiftLeft16 sl16(ins[16:31], alui);
ShiftLeft sl(res_se, res_sl);
mux32tri alusrc(clk, RData2, res_se, 32'd0, ALUSrc, val2);
AluControl ac1(clk,ALUOp, ins[26:31], Inm, ALUOpFinal, operation);
alu a1(clk,RData1, val2, operation, zero, aluresult, overflow, carry);
DataMemory dm(clk, aluresult, RData2, MemWrite, MemRead, RDataDM);
mux32tri mtorg(clk, aluresult, RDataDM, res, MemtoReg, blui);
mux32 mlui(clk, blui, alui, lui, WData);


//initial
	//$monitor($time,"ins: %b alu1: %d, alu2: %d, res: %d, op: %b",ins, RData1, val2, aluresult, operation); 
//	$monitor($time," %b ins: %h %d, %d %d %h %h %d %d %d %d",clk, ins, RData1, val2, aluresult, operation, res_sl, res2, res_branch, inPC, outAd);

endmodule
