module test_bench;

reg clk;
reg [31:0] Reg1, Reg2;
reg [3:0] op;
wire zero,overflow,carry;
wire [31:0] result;

alu tb(clk, Reg1, Reg2, op, zero, result, overflow, carry);

initial
begin

clk = 1'b0;

#10

Reg1 = 3;
Reg2 = 2;
op = 4'b0000;

#20
op = 4'b0001;
#20
op = 4'b0010;
#20
op = 4'b0110;
#20
op = 4'b0111;
#20
op = 4'b1100;
#10
$finish;

end

always
        #10 clk =! clk;

initial
        $monitor ($time,"Read1: %b, Read2: %b, Result: %b\n", Reg1, Reg2, result);
endmodule                        
