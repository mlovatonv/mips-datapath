module AluControl(ALUOp, Funct, Inm, ALUOpFinal, Control);
input Inm;
input [1:0] ALUOp;
input [5:0] Funct;
input [3:0] ALUOpFinal;
output reg[3:0] Control;

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
