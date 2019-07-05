module control(clk, func, ins, RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, ALUOpFinal, Inm, Jump, negzero, lui);

input clk;
input [0:5] ins, func;
output reg Branch, RegWrite, Inm, Jump, negzero, lui;
output reg [0:1] MemRead, MemtoReg, MemWrite, RegDst, ALUSrc;
output reg  [0:1] ALUOp;
output reg [0:3] ALUOpFinal;

initial begin
        Branch = 0;
end

always @ (*)  begin
	Inm = 0;
        Jump = 0;
        negzero = 0;
        lui = 0;
	case (ins)
	6'b000000: begin //R operations
		RegDst = 1;
		ALUSrc = 0;
		MemtoReg = 0;
		RegWrite = 1;
		MemRead = 0;
		MemWrite = 0;
		Branch = 0;
		ALUOp = 2'b10;
                if (func == 6'b001000) begin
                        RegWrite = 0;
                end
	end
        6'b001000: begin //addi
		RegDst = 0;
                ALUSrc = 1;
                MemtoReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 2'b10;
		ALUOpFinal = 4'b0010;//suma
		Inm = 1'b1;
	end
	6'b001100: begin //andi
		RegDst = 0;
                ALUSrc = 1;
                MemtoReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 2'b10;
                ALUOpFinal = 4'b0000;//and
		Inm = 1'b1;
	end
	6'b001101: begin //ori
		RegDst = 0;
                ALUSrc = 1;
                MemtoReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 2'b10;
                ALUOpFinal = 4'b0001;//or
		Inm = 1'b1;
	end
	6'b001010: begin //slti
		RegDst = 0;
                ALUSrc = 1;
                MemtoReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 2'b10;
                ALUOpFinal = 4'b0111;//slt
		Inm = 1'b1;
	end
	6'b100000: begin //lb
		RegDst = 0;
                ALUSrc = 1;
                MemtoReg = 1;
                RegWrite = 1;
                MemRead = 1;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 2'b00;
                ALUOpFinal = 4'b0010;//suma
                Inm = 1'b1;
	end
        6'b100001: begin //lh
		RegDst = 0;
                ALUSrc = 1;
                MemtoReg = 1;
                RegWrite = 1;
                MemRead = 2;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 2'b10;
                ALUOpFinal = 4'b0010;//suma
                Inm = 1'b1;
	end
	6'b100011: begin //lw
		RegDst = 0;
                ALUSrc = 1;
                MemtoReg = 1;
                RegWrite = 1;
                MemRead = 3;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 2'b10;
                ALUOpFinal = 4'b0010;//suma
                Inm = 1'b1;	end
	6'b101000: begin //sb
		RegDst = 0;
                ALUSrc = 1;
                MemtoReg = 1;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 1;
                Branch = 0;
                ALUOp = 2'b10;
                ALUOpFinal = 4'b0010;//suma
                Inm = 1'b1;
	end
	6'b101001: begin //sh
		RegDst = 0;
                ALUSrc = 1;
                MemtoReg = 1;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 2;
                Branch = 0;
                ALUOp = 2'b10;
                ALUOpFinal = 4'b0010;//suma
                Inm = 1'b1;
	end
	6'b101011: begin //sw
		RegDst = 0;
                ALUSrc = 1;
                MemtoReg = 1;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 3;
                Branch = 0;
                ALUOp = 2'b10;
                ALUOpFinal = 4'b0010;//suma
                Inm = 1'b1;
	end
	6'b001111: begin //lui
		RegDst = 0;
                ALUSrc = 0;
                MemtoReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                lui = 1;
	end
	6'b000100: begin //beq
                RegDst = 0;
                ALUSrc = 0;
                MemtoReg = 0;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 0;
                Branch = 1;
                ALUOp = 2'b01;
	end
	6'b000101: begin //bneq
		RegDst = 0;
                ALUSrc = 0;
                MemtoReg = 0;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 0;
                Branch = 1;
                ALUOp = 2'b01;
                negzero = 1;
	end
        6'b000001: begin //bgez
		RegDst = 0;
                ALUSrc = 0;
                MemtoReg = 0;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 0;
                Branch = 1;
                ALUOpFinal = 4'b0111;//slt
                //negzero = 1;
                Inm = 1'b1;
	end
	6'b000010: begin //j
                Jump = 1;
		RegDst = 0;
                ALUSrc = 1;
                MemtoReg = 0;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;

	end
	6'b000011: begin //jal
                Jump = 1;
		RegDst = 2;
                ALUSrc = 1;
                MemtoReg = 2;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
	end
	
	endcase

end

endmodule
