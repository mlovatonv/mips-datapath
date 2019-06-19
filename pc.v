module ProgramCounter (clk, reset, inPC, outAd);

input clk, reset;
input [31:0] inPC;
output reg [31:0] outAd;

initial
        outAd = 0;

always@(negedge clk)
begin
	//assign outAd = 0;
	if(reset == 1)
		assign outAd = 0;
	else
	begin
		assign outAd = inPC;

	end
end
endmodule
