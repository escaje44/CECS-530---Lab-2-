`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineer: Jeremy Escamilla
// 
// Create Date: 08/24/2021 10:16:03 PM
// Design Name: ALU Control unit
// Module Name: LEGv8ALU_control
// Project Name: Lab 2 - ALU 
//
// Description: 
//  Program the Controller corresponding to the LEG v8 ALU.
// Dependencies: 
//  Requires values initialized for Inputs, and an ALU to control properly function.
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//  ALU Controller Table
// ALUOp    Opcode_field           ALU_operation
//           [I(31-21)]
//  00  -   xxxx xxxx xxx     -     1100 : NOR           
//  x1  -   xxxx xxxx xxx     -     0111 : PASS INPUT B
//  1x  -   100 0101 1000     -     0010 : OR 
//            (11'h458)
//  1x  -   110 0101 1000     -     0110 : SUB
//            (11'h658)
//  1x  -   100 0101 0000     -     0000 : AND
//            (11'h450)
//  1x  -   101 0101 0000     -     0001 : OR
//            (11'h550)
//  
//////////////////////////////////////////////////////////////////////////////////


module LEGv8ALU_control(
    input [1:0] ALU_op,
    input [10:0] Opcode_field,
    output reg [3:0] ALU_operation
    );
    
    wire [15:0] input_field; //concatenated input field based on table
    
    always@(*) begin
        if(ALU_op == 2'b00) 
            ALU_operation <= 4'hC; //1100 = NOR
        else if (ALU_op == 2'b01) //PASS INPUT B
            ALU_operation <= 4'h7; //0111 = PASS INPUT B
        else
          begin  
            //begin case statement based on chosen ALU operation input
            case(Opcode_field)
              //OR
              11'h458:begin
                ALU_operation <= 4'h2; //0010
              end
              //SUB
              11'h658:begin
                ALU_operation <= 4'h6; //0110
               end
              //AND
              11'h450:begin
                ALU_operation <= 4'h0; //0000
               end
              //OR
              11'h550:begin
                ALU_operation <= 4'h1; //0001
               end
            endcase//ends case statement
          end//end else
    end //end always
    
endmodule
