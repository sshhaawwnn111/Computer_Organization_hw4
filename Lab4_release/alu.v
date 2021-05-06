/***************************************************
Student Name:
Student ID: Lab4_release
***************************************************/
   `timescale 1ns/1ps

   module alu(
       input                   rst_n,         // negative reset            (input)
       input        [32-1:0]   src1,          // 32 bits source 1          (input)
       input        [32-1:0]   src2,          // 32 bits source 2          (input)
       input        [ 4-1:0]   ALU_control,   // 4 bits ALU control input  (input)
       output reg   [32-1:0]   result,        // 32 bits result            (output)
       output               Zero          // 1 bit when the output is 0, zero must be set (output)
   );

    reg signed [32:0] temp;
    reg Zero_o;
    reg cout;
    assign Zero = Zero_o;
/* Write your code HERE */
	always@(*) begin

		if(~rst_n) begin // reset
			result = 0;
		end
		else if(ALU_control == 4'b0000) begin // And
			result = src1&src2;
			cout = 0;
		end
		else if(ALU_control == 4'b0001) begin // OR
			result = src1|src2;
			cout = 0;
		end
		else if(ALU_control == 4'b0010) begin // addition
			temp = src1 + src2;
			result = src1 + src2;
			if(temp[32] == 1) begin
				cout = 1;
			end
			else begin
				cout = 0;
			end
		end
		else if(ALU_control == 4'b0110) begin // Subtract
			temp = src1 - src2;
			result = src1 - src2;
			if(temp[32] == 1) begin
				cout = 1;
			end
			else begin
				cout = 0;
			end
		end
		else if(ALU_control == 4'b0111) begin // Set les than
			temp = src1 - src2;
			if(src1 < src2) begin
				result = 1;
			end
			else begin
				result = 0;
			end
			cout = 0;
		end
		else if(ALU_control == 4'b1100) begin // NOR
			result = ~(src1 | src2);
			cout = 0;
		end
		else if(ALU_control == 4'b1101) begin // NAND
			result = ~(src1 & src2);
			cout = 0;
		end
		else if(ALU_control == 4'b0011) begin // XOR ALU_control == 3
			result = src1 ^ src2;
			cout = 0;
		end
		else if(ALU_control == 4'b0100) begin // Shift Left Logical ALU_control == 4
			result = src1 << src2;
			cout = 0;
		end
		else if(ALU_control == 4'b0101) begin // Shift Right Arithmetic ALU_control == 5
			result = src1 >>> src2;
			cout = 0;
		end


		if(result == 0) begin // Z
			Zero_o = 1;
		end
		else begin
			Zero_o = 0;
		end

	end

   endmodule
