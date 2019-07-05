module ShiftLeft(innum, outnum);

input [31:0] innum;
output [31:0] outnum;

assign outnum = innum<<2;

endmodule

module ShiftLeft16(innum, outnum);

input [0:15] innum;
output [0:31] outnum;

assign outnum = innum << 16;

endmodule
