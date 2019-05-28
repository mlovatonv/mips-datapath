module test_bench;

reg clk;
reg [2:0] ReadRegister1, ReadRegister2;
reg [2:0] WriteRegister;
reg [15:0] WriteData;
wire [15:0] ReadData1, ReadData2;

registerFile tb(clk, ReadRegister1, ReadRegister2, WriteRegister, WriteData, ReadData1, ReadData2);

initial
begin 

clk = 1'b0;
ReadRegister1 = 3'b000;
ReadRegister2 = 3'b001;

WriteRegister = 3'b010;

WriteData <= 20;

#100

ReadRegister1 = 3'b100;
ReadRegister2 = 3'b101;
WriteRegister = 3'b100;
WriteData <= 1;

end

always
	#10 clk =! clk;

initial
	#1000 $finish;

initial
	$monitor ("Read1: %b, Read2: %b\n", ReadData1, ReadData2);
endmodule
