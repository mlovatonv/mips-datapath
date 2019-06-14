module registerFile(clk, ReadRegister1, ReadRegister2, WriteRegister, WriteData, ReadData1, ReadData2, Write);

reg [31:0] registers [0:31];

input clk, Write;
input [4:0] ReadRegister1, ReadRegister2;
input [4:0] WriteRegister;
input [31:0] WriteData;
output reg [31:0] ReadData1, ReadData2;
integer f;
reg [4:0] dig;

initial begin
        $readmemb("output.txt",registers);
	//f = $fopen("output.txt", "w");
end

always @(posedge clk)
begin
        ReadData1 <= registers[ReadRegister1];
        ReadData2 <= registers[ReadRegister2];
end

always @(negedge clk)
begin
	if(Write == 1) begin
                registers[WriteRegister] <= WriteData;
		$writememb("output.txt", registers);
	//	f = $fopen("output.txt");
	//	for(dig = 5'b0; dig <= 5'b11111; dig = dig + 5'b00001)
	//		$fwrite(f,"%b\n", registers[dig]);
	//	$fclose(f);
	end
end
endmodule

