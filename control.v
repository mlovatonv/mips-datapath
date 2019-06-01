module control(clk, ins, RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);

input clk;
input [5:0] ins;
output reg RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite;

always@(posedge clk) begin
if(ins == 6'b000000)
begin
	assign RegDst = 1;
	assign RegWrite = 1;
end
end

endmodule
