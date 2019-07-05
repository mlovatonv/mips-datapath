module ProgramCounter (clk, reset, inPC, outAd);

input clk, reset;
input [0:31] inPC;
output reg [0:31] outAd;
reg block;

initial begin
        outAd = 0;
		block = 1;
		//#15 block = 0;
end


always@(negedge clk)
begin
	//assign outAd = 0;
	if(reset == 1)
		outAd = 0;
	else begin
		if(inPC==0 || inPC>0) begin
			outAd = inPC;
		end
	end
end
endmodule
