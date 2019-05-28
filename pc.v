module ProgramCounter (clk, reset, inPC, outAd);

input clk, reset;
input [9:0] inPC;
output reg [9:0] outAd;

initial
	outAd = 0;

always@(posedge clk)
begin
	if(reset == 1)
		assign outAd = 0;
	else
	begin
		assign outAd = inPC;
		
	end	
end

endmodule
