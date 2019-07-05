module add(clk, val1, val2, ans);
input clk;
input [0:31] val1, val2;
output reg [0:31] ans;

always @(*)
    ans = val1 + val2;
endmodule

module addjump(val1, val2, ans);

input [0:31] val1, val2;
output reg [0:31] ans;

always @(*)
begin
    ans = val1;
    ans[0:3] = val2[0:3];
end

endmodule

/*
module addj(val1, val2, ans);

input [31:0] val1;
input [31:0] val2;
output [31:0] ans;

assign ans = val1 + val2;

endmodule*/

