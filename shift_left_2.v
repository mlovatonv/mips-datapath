module ShiftLeft(innum, outnum);

input [31:0] innum;
output [31:0] outnum;

assign outnum = innum<<2;

endmodule
