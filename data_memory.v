module DataMemory(clk, Address, WriteData, MemWrite, MemRead, ReadData);

reg [7:0] Memory [0:1023];

input MemWrite, MemRead, clk;
output reg [31:0] ReadData;
input [31:0] WriteData;
input [31:0] Address;

initial begin
	$readmemb("memory.txt", Memory);
end

always @(posedge clk)
begin
	if(MemWrite) begin
		Memory[Address] <= WriteData;
	end
	if(MemRead) begin
		ReadData = Memory[Address];
	end
end

endmodule
