module test_bench;

reg clk, sel;
reg [4:0] Read1, Read2, Write;
reg [3:0] op;
reg [15:0] inm;
wire zero, overflow, carry;
wire [31:0] result;

dp d1(clk, Read1, Read2, Write, op, zero, overflow, carry, inm, sel, result);


initial
begin
	clk = 1'b0;
	Read1 = 5'b00001;
	Read2 = 5'b00010;
	Write = 5'b00000;
	inm = 16'b1111111111111111;
	op = 4'b0000;
	sel = 1'b0;
	#50
	sel = ~sel;
	#20
	op = 4'b0001;
	#20
	sel = ~sel;
	#20
	op = 4'b0010;
	#20
	sel = ~sel;
	#20
	op = 4'b0110;
	#20
	sel = ~sel;
	#20
	op = 4'b0111;
	#20
	sel = ~sel;
	#20
	op = 4'b1100;
	#20
	sel = ~sel;

	#10
	$finish;
end

always
	#10 clk = ! clk;
always begin
	#20
	if(sel == 1'b0)begin
	case(op)
        4'b0000 : $display("A and B, result: %b\n", result);
        4'b0001 : $display("A or B, result: %b\n", result);
        4'b0010 : begin
                if(overflow)
                        $display("Overflow, A + B = %b%b\n",carry, result);
                else
                        $display("A + B =  %b\n", result);
		end
        4'b0110 : $display("A - B = %b\n", result);
	4'b0111 : $display("A < B, result: %b\n", result);
	4'b1100 : $display("A nor B, result: %b\n", result);
	endcase
	end
	
	if(sel == 1'b1) begin
        case(op)
	4'b0000 : $display("A and %d, result: %b\n",inm, result);
        4'b0001 : $display("A or %d, result: %b\n",inm, result);
        4'b0010 : begin
                if(overflow)
                        $display("Overflow, A + %d = %b%b\n",inm, carry, result);
                else
                        $display("A + %d =  %b\n",inm, result);
	        end
        4'b0110 : $display("A - %d = %b\n",inm, result);
        4'b0111 : $display("A < %d, result: %b\n",inm, result);
        4'b1100 : $display("A nor %d, result: %b\n",inm, result);
        endcase

	end
end

endmodule

