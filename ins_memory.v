module InstructionMemory (ReadAddress, Instruction);

input [9:0]  ReadAddress;
output [31:0] Instruction;
reg [7:0] Memory [0:1023];

initial 
	$readmemh("instructions.txt", Memory);

assign Instruction[7:0]   = Memory[ReadAddress + 3];
assign Instruction[15:8]  = Memory[ReadAddress + 2];
assign Instruction[23:16] = Memory[ReadAddress + 1];
assign Instruction[31:24] = Memory[ReadAddress];


endmodule
