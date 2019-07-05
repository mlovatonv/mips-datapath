module control(clk,ins, RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, ALUOpFinal, Inm);

input clk;
input [0:5] ins;
output reg RegDst, Branch, MemtoReg, ALUSrc, RegWrite, Inm;
output reg [0:1] MemRead, MemWrite;
output reg  [0:1] ALUOp;
output reg [0:3] ALUOpFinal;

initial begin
        Branch = 0;
end

always @ (*)  begin
	Inm = 0;
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
                ALUSrc = 1;
                MemtoReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 2'b10;
                ALUOpFinal = 4'b0000;//suma1
	end
	6'b000100: begin //beq
                ALUSrc = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 1;
                ALUOp = 2'b01;
	end
	6'b000101: begin //bneq
		RegDst = 0;
                ALUSrc = 1;
                MemtoReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 2'b10;
                ALUOpFinal = 4'b0000;//suma
	end
	6'b000010: begin //j
		RegDst = 0;
                ALUSrc = 1;
                MemtoReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 2'b10;
                ALUOpFinal = 4'b0000;//suma

	end
	6'b000011: begin //jal
		RegDst = 0;
                ALUSrc = 1;
                MemtoReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 2'b10;
                ALUOpFinal = 4'b0000;//suma
	end
	6'b000001: begin //bgez
		RegDst = 0;
                ALUSrc = 1;
                MemtoReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 2'b10;
                ALUOpFinal = 4'b0000;//suma
	end
	
	endcase

end

endmodule
