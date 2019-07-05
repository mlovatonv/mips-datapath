module InstructionMemory (clk,ReadAddress, Instruction);

input clk;
input [0:31]  ReadAddress;
output reg[0:31] Instruction;
reg [0:7] Memory [0:255];

initial begin
        //$readmemh("Ins1hex.txt", Memory);
		//$readmemh("Ins2hex.txt", Memory);
		$readmemh("Ins3hex.txt", Memory);
end

always@(*)
begin
	 Instruction[0:7] = Memory[ReadAddress];
	 Instruction[8:15] = Memory[ReadAddress + 1];
	 Instruction[16:23] = Memory[ReadAddress + 2];
	 Instruction[24:31] = Memory[ReadAddress + 3];
end

endmodule
