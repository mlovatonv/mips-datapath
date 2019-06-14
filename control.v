module control(clk, ins, RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, ALUOpFinal, Inm);

input clk;
input [5:0] ins;
output reg RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Inm;
output reg [1:0] ALUOp;
output reg [3:0] ALUOpFinal;

always@(posedge clk) begin
	assign Inm = 0;
	case (ins)
	6'b000000: begin //R operations
		assign RegDst = 1;
		assign ALUSrc = 0;
		assign MemtoReg = 0;
		assign RegWrite = 1;
		assign MemRead = 0;
		assign MemWrite = 0;
		assign Branch = 0;
		assign ALUOp = 2'b10;
	end
	6'b100011: begin //lw
		assign RegDst = 0;
                assign ALUSrc = 1;
                assign MemtoReg = 1;
                assign RegWrite = 1;
                assign MemRead = 1;
                assign MemWrite = 0;
                assign Branch = 0;
                assign ALUOp = 2'b00;
	end
	6'b101011: begin //sltu
                assign ALUSrc = 1;
                assign RegWrite = 0;
                assign MemRead = 0;
                assign MemWrite = 1;
                assign Branch = 0;
                assign ALUOp = 2'b00;
	end
	6'b000100: begin //beq
                assign ALUSrc = 0;
                assign RegWrite = 1;
                assign MemRead = 0;
                assign MemWrite = 0;
                assign Branch = 1;
                assign ALUOp = 2'b01;
	end
	6'b001000: begin //addi
		assign RegDst = 0;
                assign ALUSrc = 1;
                assign MemtoReg = 0;
                assign RegWrite = 1;
                assign MemRead = 0;
                assign MemWrite = 0;
                assign Branch = 0;
                assign ALUOp = 2'b10;
		assign ALUOpFinal = 4'b0010;//suma
		assign Inm = 1'b1;
	end
	6'b001100: begin //andi
		assign RegDst = 0;
                assign ALUSrc = 1;
                assign MemtoReg = 0;
                assign RegWrite = 1;
                assign MemRead = 0;
                assign MemWrite = 0;
                assign Branch = 0;
                assign ALUOp = 2'b10;
                assign ALUOpFinal = 4'b0000;//and
		assign Inm = 1'b1;
	end
	6'b001101: begin //ori
		assign RegDst = 0;
                assign ALUSrc = 1;
                assign MemtoReg = 0;
                assign RegWrite = 1;
                assign MemRead = 0;
                assign MemWrite = 0;
                assign Branch = 0;
                assign ALUOp = 2'b10;
                assign ALUOpFinal = 4'b0001;//or
		assign Inm = 1'b1;
	end
	6'b001010: begin //slti
		assign RegDst = 0;
                assign ALUSrc = 1;
                assign MemtoReg = 0;
                assign RegWrite = 1;
                assign MemRead = 0;
                assign MemWrite = 0;
                assign Branch = 0;
                assign ALUOp = 2'b10;
                assign ALUOpFinal = 4'b0111;//slt
		assign Inm = 1'b1;
	end
	6'b000101: begin //bneq
		assign RegDst = 0;
                assign ALUSrc = 1;
                assign MemtoReg = 0;
                assign RegWrite = 1;
                assign MemRead = 0;
                assign MemWrite = 0;
                assign Branch = 0;
                assign ALUOp = 2'b10;
                assign ALUOpFinal = 4'b0000;//suma
	end
	6'b000010: begin //j
		assign RegDst = 0;
                assign ALUSrc = 1;
                assign MemtoReg = 0;
                assign RegWrite = 1;
                assign MemRead = 0;
                assign MemWrite = 0;
                assign Branch = 0;
                assign ALUOp = 2'b10;
                assign ALUOpFinal = 4'b0000;//suma

	end
	6'b000011: begin //jal
		assign RegDst = 0;
                assign ALUSrc = 1;
                assign MemtoReg = 0;
                assign RegWrite = 1;
                assign MemRead = 0;
                assign MemWrite = 0;
                assign Branch = 0;
                assign ALUOp = 2'b10;
                assign ALUOpFinal = 4'b0000;//suma
	end
	6'b000001: begin //bgez
		assign RegDst = 0;
                assign ALUSrc = 1;
                assign MemtoReg = 0;
                assign RegWrite = 1;
                assign MemRead = 0;
                assign MemWrite = 0;
                assign Branch = 0;
                assign ALUOp = 2'b10;
                assign ALUOpFinal = 4'b0000;//suma
	end
	6'b100000: begin //lb
		assign RegDst = 0;
                assign ALUSrc = 1;
                assign MemtoReg = 0;
                assign RegWrite = 1;
                assign MemRead = 0;
                assign MemWrite = 0;
                assign Branch = 0;
                assign ALUOp = 2'b10;
                assign ALUOpFinal = 4'b0000;//suma
	end
	6'b100001: begin //lh
		assign RegDst = 0;
                assign ALUSrc = 1;
                assign MemtoReg = 0;
                assign RegWrite = 1;
                assign MemRead = 0;
                assign MemWrite = 0;
                assign Branch = 0;
                assign ALUOp = 2'b10;
                assign ALUOpFinal = 4'b0000;//suma
	end
	6'b101000: begin //sb
		assign RegDst = 0;
                assign ALUSrc = 1;
                assign MemtoReg = 0;
                assign RegWrite = 1;
                assign MemRead = 0;
                assign MemWrite = 0;
                assign Branch = 0;
                assign ALUOp = 2'b10;
                assign ALUOpFinal = 4'b0000;//suma
	end
	6'b101001: begin //sh
		assign RegDst = 0;
                assign ALUSrc = 1;
                assign MemtoReg = 0;
                assign RegWrite = 1;
                assign MemRead = 0;
                assign MemWrite = 0;
                assign Branch = 0;
                assign ALUOp = 2'b10;
                assign ALUOpFinal = 4'b0000;//suma
	end
	6'b101011: begin //sw
		assign RegDst = 0;
                assign ALUSrc = 1;
                assign MemtoReg = 0;
                assign RegWrite = 1;
                assign MemRead = 0;
                assign MemWrite = 0;
                assign Branch = 0;
                assign ALUOp = 2'b10;
                assign ALUOpFinal = 4'b0000;//suma
	end
	6'b001111: begin //lui
		assign RegDst = 0;
                assign ALUSrc = 1;
                assign MemtoReg = 0;
                assign RegWrite = 1;
                assign MemRead = 0;
                assign MemWrite = 0;
                assign Branch = 0;
                assign ALUOp = 2'b10;
                assign ALUOpFinal = 4'b0000;//suma1
	end
	endcase

end

endmodule
