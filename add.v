module add(val1, val2, ans);
input [31:0] val1, val2;
output [31:0] ans;

assign ans = val1 + val2;

endmodule

module addj(val1, val2, ans);

input [9:0] val1;
input [31:0] val2;
output [9:0] ans;

assign ans = val1 + val2;

endmodule

