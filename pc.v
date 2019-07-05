module ProgramCounter (clk, reset, inPC, outAd);

input clk, reset;
input [0:31] inPC;
output reg [0:31] outAd;

initial
        outAd = 0;


always@(negedge clk)
begin
	//assign outAd = 0;
	if(reset == 1)
		outAd = 0;
	else begin
		if(inPC)
			outAd = inPC;
	end
end
endmodule
