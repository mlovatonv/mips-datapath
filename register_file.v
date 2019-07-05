module registerFile(clk, ReadRegister1, ReadRegister2, WriteRegister, WriteData, ReadData1, ReadData2, Write);

reg [31:0] registers [0:31];

input clk, Write;
input [4:0] ReadRegister1, ReadRegister2;
input [31:0] WriteRegister;
input [31:0] WriteData;
output reg[31:0] ReadData1, ReadData2;
reg [4:0] dig;

initial begin
        $readmemh("registers.txt",registers);
	//f = $fopen("output.txt", "w");
end

//assign ReadData1 = registers[ReadRegister1];
//assign ReadData2 = registers[ReadRegister2];

always @(*)
begin
	if(clk == 0) begin
        ReadData1 = registers[ReadRegister1];
        ReadData2 = registers[ReadRegister2];
		end
end

always @(posedge clk)
begin
	if(Write == 1) begin
        registers[WriteRegister] = WriteData;
		$writememh("output.txt", registers);
	end
end
endmodule

