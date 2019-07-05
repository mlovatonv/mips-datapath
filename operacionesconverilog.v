module xd(clk,c);
input clk;
reg [31:0]a, b;
output reg [31:0] c;
initial begin
    a = 4294967295;
    b = 131072;
end

always@(posedge clk)
    c = (32'hffff<<16);

endmodule

module tb;
reg clk;
wire [31:0]c;
xd xd(clk,c);

initial
    $monitor("%b", c);

initial begin
 clk = 0;
 #50 $finish;
end

 always
    #10 clk = !clk;

endmodule