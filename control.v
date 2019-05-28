module Control(Ins, RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);

input [5:0]Ins;
output reg RegDst, Branch, MemRead, MemWrite,MemtoReg, ALUSrc, RegWrite;
output reg [5:0] ALUOp;

if(Ins == 6'b000000)
begin
	assign RegDst = 1;
	assign RegWrite = 1;
	assign ALUSrc = 0;
	assign ALUOp = 0;
	assign MemWrite = 1;
	assign MemRead = 1;
	assign MemtoReg = 0;
	assign PCSrc = 0;

end

endmodule
