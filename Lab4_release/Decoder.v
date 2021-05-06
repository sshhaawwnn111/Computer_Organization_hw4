/***************************************************
Student Name:
Student ID: Lab4_release
***************************************************/

   `timescale 1ns/1ps

   module Decoder(
       input   [7-1:0]     instr_i,
       output              RegWrite,
       output              Branch,
       output              Jump,
       output              WriteBack1,
       output              WriteBack0,
       output              MemRead,
       output              MemWrite,
       output              ALUSrcA,
       output              ALUSrcB,
       output  [2-1:0]     ALUOp
   );

   /* Write your code HERE */
wire	[7-1:0]		opcode;
reg ALUSrcA_o;
reg ALUSrcB_o;
reg RegWrite_o;
reg Branch_o;
reg Jump_o;
reg WriteBack1;
reg WriteBack0;
reg MemRead_o;
reg MemWrite_o;
reg [1:0] ALUOp_o;

assign opcode = instr_i[6:0];
assign ALUSrcA = ALUSrcA_o;
assign ALUSrcB = ALUSrcB_o;
assign RegWrite = RegWrite_o;
assign Branch = Branch_o;
assign Jump = Jump_o;
assign WriteBack1_o = WriteBack1;
assign WriteBack0_o = WriteBack0;
assign MemRead = MemRead_o;
assign MemWrite = MemWrite_o;
assign ALUOp = ALUOp_o;

always@(*) begin
	if(opcode == 7'b0110011) begin // R type
		ALUSrcA_o = 0;
        ALUSrcB_o = 0;
		RegWrite_o = 1;
		Branch_o = 0;
        Jump_o = 0;
        WriteBack1_o = 0;
        WriteBack0_o = 0;
        MemRead_o = 0;
        MemWrite_o = 0;
		ALUOp_o = 2'b10;
	end
	else if(opcode == 7'b0000011) begin //LW
		ALUSrcA_o = 0;
        ALUSrcB_o = 1;
		RegWrite_o = 1;
		Branch_o = 0;
        Jump_o = 0;
        WriteBack1_o = 0;
        WriteBack0_o = 1;
        MemRead_o = 1;
        MemWrite_o = 0;
		ALUOp_o = 2'b00;
	end
	else if(opcode == 7'b0100011) begin //SW
		ALUSrcA_o = 0;
        ALUSrcB_o = 1;
		RegWrite_o = 0;
		Branch_o = 0;
        Jump_o = 0;
        WriteBack1_o = 0;
        WriteBack0_o = 0;
        MemRead_o = 0;
        MemWrite_o = 1;
		ALUOp_o = 2'b00;
	end
	else if(opcode == 7'b1100011) begin //beq
		ALUSrcA_o = 0;
        ALUSrcB_o = 1;
		RegWrite_o = 0;
		Branch_o = 1;
        Jump_o = 0;
        WriteBack1_o = 0;
        WriteBack0_o = 0;
        MemRead_o = 0;
        MemWrite_o = 0;
		ALUOp_o = 2'b01;
	end
    else if(opcode == 7'b1101111) begin //jal
        ALUSrcA_o = 0;
        ALUSrcB_o = 1;
        RegWrite_o = 0;
        Branch_o = 0;
        Jump_o = 1;
        WriteBack1_o = 1;
        WriteBack0_o = 0;
        MemRead_o = 0;//don't care
        MemWrite_o = 0;//don't care
        ALUOp_o = 2'b00; //don't care
    end
    else if(opcode == 7'b1100111) begin //jalr
        ALUSrcA_o = 1;
        ALUSrcB_o = 1;
        RegWrite_o = 0;
        Branch_o = 0;
        Jump_o = 1;
        WriteBack1_o = 1;
        WriteBack0_o = 0;
        MemRead_o = 0;//don't care
        MemWrite_o = 0;//don't care
        ALUOp_o = 2'b00;//don't care
    end
end
endmodule

