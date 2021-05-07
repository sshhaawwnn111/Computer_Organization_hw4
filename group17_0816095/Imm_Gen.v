/***************************************************
Student Name:Shawn
Student ID: group17_0816095
***************************************************/

   `timescale 1ns/1ps

   module Imm_Gen(
       input  [31:0] instr_i,
       output reg[31:0] Imm_Gen_o
   );

   //Internal Signals
   wire    [7-1:0] opcode;
   wire    [2:0]   func3;
   wire    [3-1:0] Instr_field;

   assign opcode = instr_i[6:0];
   assign func3  = instr_i[14:12];

   /* Write your code HERE */

    always@(*) begin
        if(opcode == 7'b0010011 || opcode == 7'b0000011 || opcode == 7'b1100111) begin // I-type
            Imm_Gen_o[31:11] = {21{instr_i[31]}};
            Imm_Gen_o[10:0] = instr_i[30:20];
        end
        else if(opcode == 7'b0100011) begin // S-type
            Imm_Gen_o[31:11] = {21{instr_i[31]}};
            Imm_Gen_o[10:5] = instr_i[30:25];
            Imm_Gen_o[4:0] = instr_i[11:7];
        end
        else if(opcode == 7'b1100011) begin // B-type
            Imm_Gen_o[31:11] = {21{instr_i[31]}};
            Imm_Gen_o[10:5] = instr_i[30:25];
            Imm_Gen_o[4:1] = instr_i[11:8];
            Imm_Gen_o[0] = 0;
        end
        else if(opcode == 7'b1101111) begin //j-type
            Imm_Gen_o[31:20] = {12{instr_i[31]}};
            Imm_Gen_o[19:12] = instr_i[19:12];
            Imm_Gen_o[11] = instr_i[20];
            Imm_Gen_o[10:1] = instr_i[30:21];
            Imm_Gen_o[0] = 0;
        end
    end


   endmodule
