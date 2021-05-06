/***************************************************
Student Name:Shawn
Student ID:0816095
***************************************************/

   `timescale 1ns/1ps
   /*instr[30,14:12]*/
   module ALU_Ctrl(
       input       [4-1:0] instr,
       input       [2-1:0] ALUOp,
       output      [4-1:0] ALU_Ctrl_o
   );
   wire [2:0] func3;
   assign func3 = instr[2:0];
   /* Write your code HERE */
   reg [3:0] ALU_Ctrl;
   assign ALU_Ctrl_o = ALU_Ctrl;
always@(*) begin
	if(ALUOp == 2'b00) begin //sw, lw
		ALU_Ctrl = 4'b0010; //addition
	end
	else if(ALUOp == 2'b01) begin //beq
		ALU_Ctrl = 4'b0110; //subtraction
	end
	else if(ALUOp == 2'b10) begin //R-type
		if(instr == 4'b0000) begin //addition
			ALU_Ctrl = 4'b0010;
		end
		else if(instr == 4'b1000) begin //subtract
			ALU_Ctrl = 4'b0110;
		end
		else if(instr == 4'b0010) begin //slt
			ALU_Ctrl = 4'b0111;
		end
		else if(instr == 4'b0111) begin //and
			ALU_Ctrl = 4'b0000;
		end
		else if(instr == 4'b0110) begin //or
			ALU_Ctrl = 4'b0001;
		end
		else if(instr == 4'b0100) begin //XOR
			ALU_Ctrl = 4'b0011;
		end
		else if(instr == 4'b0001) begin //sll
			ALU_Ctrl = 4'b0100;
		end
		else if(instr == 4'b1101) begin //sra
			ALU_Ctrl = 4'b0101;
		end
	end
	else if(ALUOp == 2'b11) begin
		ALU_Ctrl = 4'b0010;
	end
end


   endmodule

