`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineer: Jeremy Escamilla
// 
// Create Date: 08/24/2021 09:11:31 PM
// Design Name: LEGv8 Processor ALU
// Module Name: LEGv8ALU
// Project Name: Lab 2 - ALU 
//
// Description: 
//    Program an ALU corresponding to the LEGv8 processor (less complicated than prior ARM ALUs coded.
//    This is considered part A of Lab 2.
// 
// Dependencies: 
//  Requires initialized values for ALU operation value, A, and B inputs to function properly
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//  Operation Table: 
//  ALU Op    -     Function    -     ALU Result
//  0000      -       AND       -       A & B
//  0001      -       OR        -       A | B
//  0010      -       ADD       -       A + B
//  0110      -       SUB       -       A - B
//  0111      -  PASS INPUT  B  -         B
//  1100      -       NOR       -     ~(A | B)
// 
//Note:  Assuming NO carry bit
//////////////////////////////////////////////////////////////////////////////////


module LEGv8ALU(
    input [3:0] ALU_operation,
    input [63:0] A,B,
    output reg [63:0] ALU_result,
    output Zero
    );
    
    //code starts here
    
    assign Zero = (ALU_result == 64'b0)?1'b1:1'b0; //If all are Zero.
        
    always@(*)begin
        
        //begin case statement based on chosen ALU operation input
        case(ALU_operation)
            //AND
            4'b0000:begin
              ALU_result = A & B;
            end
            //OR
            4'b0001:begin
              ALU_result = A | B;
            end
            //ADD
            4'b0010:begin
              ALU_result = A + B;
            end
            //SUB
            4'b0110:begin
              ALU_result = A - B;
            end
            //PASS B
            4'b0111:begin
              ALU_result = B;
            end
            //NOR
            4'b1100:begin
              ALU_result = ~(A | B);
            end
            //DEFAULT
            default: ALU_result = 64'd0; //If occurs
        endcase //end case statement
    end //end always
   assign Zero = (ALU_result == 64'b0)?1'b1:1'b0; //If all are Zero. 
    //code end here
    
endmodule
