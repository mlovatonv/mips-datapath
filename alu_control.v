module AluControl(clk,ALUOp, Funct, Inm, ALUOpFinal, Control);
input Inm,clk;
input [0:1] ALUOp;
input [0:5] Funct;
input [0:3] ALUOpFinal;
output reg[0:3] Control;

always@(*)
begin
	if(Inm) begin
		Control = ALUOpFinal;
	end
	else begin
		case (ALUOp)
		2'b00: Control = 4'b0010;
		2'b01: Control = 4'b0110;
		2'b10:	begin
                	case (Funct)
        	                6'b100000: Control = 4'b0010; //ADD
	                        6'b100010: Control = 4'b0110; //SUB
                	        6'b100100: Control = 4'b0000; //AND
        	                6'b100101: Control = 4'b0001; //OR
	                        6'b101010: Control = 4'b0111; //SLT
				6'b100111: Control = 4'b1100; //NOR
	                endcase
                	end
		endcase
	end

end
endmodule
