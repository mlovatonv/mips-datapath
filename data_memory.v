module DataMemory(clk, Address, WriteData, MemWrite, MemRead, ReadData);

reg [0:7] Memory [0:255];
input clk;
input [0:1] MemWrite, MemRead;
output reg [0:31] ReadData;
input [0:31] WriteData;
input [0:31] Address;

initial begin
	$readmemh("memory.txt", Memory);
end

always @(*)
begin
	ReadData = 0;
	if(MemWrite) begin
		case (MemWrite)
			1: Memory[Address] = WriteData[24:31];
			2: begin
				Memory[Address] = WriteData[16:23];
				Memory[Address + 1] = WriteData[24:31];
			end
			3: begin 
				Memory[Address] = WriteData[0:7];
				Memory[Address + 1] = WriteData[8:15];
				Memory[Address + 2] = WriteData[16:23];
				Memory[Address + 3] = WriteData[24:31];
			end
		endcase
		$writememh("memoutput.txt",Memory);
	end
	if(MemRead) begin
		case (MemRead)
			1: ReadData[24:31] = Memory[Address];
			2: begin
				ReadData[16:23] = Memory[Address];
				ReadData[24:31] = Memory[Address + 1];
			end
			3: begin
				ReadData[0:7] = Memory[Address];
				ReadData[8:15] = Memory[Address + 1];
				ReadData[16:23] = Memory[Address + 2];
				ReadData[24:31] = Memory[Address + 3];
			end
		endcase
	end
end

endmodule
