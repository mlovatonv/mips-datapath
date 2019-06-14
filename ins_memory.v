module InstructionMemory (clk, ReadAddress, Instruction);

input clk;
input [9:0]  ReadAddress;
output reg[31:0] Instruction;
reg [7:0] Memory [0:1023];

initial begin
        $readmemb("instructions.txt", Memory);
end

always@(negedge clk)
begin
	Instruction[7:0] = Memory[ReadAddress + 3];
	Instruction[15:8] = Memory[ReadAddress + 2];
	Instruction[23:16] = Memory[ReadAddress + 1];
	Instruction[31:24] = Memory[ReadAddress];
end

endmodule
