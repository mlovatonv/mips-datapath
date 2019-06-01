module registerFile(clk, ReadRegister1, ReadRegister2, WriteRegister, WriteData, ReadData1, ReadData2, Write);

reg [31:0] registers [0:31];

input clk, Write;
input [4:0] ReadRegister1, ReadRegister2;
input [4:0] WriteRegister;
input [31:0] WriteData;
output reg [31:0] ReadData1, ReadData2;

initial begin
        $readmemb("registers.txt",registers);
end

always @(posedge clk)
begin
        ReadData1 <= registers[ReadRegister1];
        ReadData2 <= registers[ReadRegister2];
end

always @(negedge clk)
begin
        if(Write == 1)
                registers[WriteRegister] <= WriteData;
end
endmodule

