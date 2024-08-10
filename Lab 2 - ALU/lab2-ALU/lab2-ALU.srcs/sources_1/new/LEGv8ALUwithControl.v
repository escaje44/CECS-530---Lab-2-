`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineer: Jeremy Escamilla
// 
// Create Date: 08/24/2021 10:16:03 PM
// Design Name: Legv8ALU + ALU Control
// Module Name: LEGv8ALUwithControl
// Project Name: Lab 2 - ALU
//
// Description: 
//  Top module that combines ALU Control and ALU into a singular cohesive working unit.
// Dependencies: 
//  Requires both ALU control and ALU units to be functional before running this module.
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//  ALU Controller Table
// ALUOp    Opcode_field           ALU_operation : function
//           [I(31-21)]
//  00  -   xxxx xxxx xxx     -     1100 (C): NOR           
//  x1  -   xxxx xxxx xxx     -     0111 (7): PASS INPUT B
//  1x  -   100 0101 1000     -     0010 (2): OR 
//            (11'h458)
//  1x  -   110 0101 1000     -     0110 (6): SUB
//            (11'h658)
//  1x  -   100 0101 0000     -     0000 (0): AND
//            (11'h450)
//  1x  -   101 0101 0000     -     0001 (1): OR
//            (11'h550)
//
//////////////////////////////////////////////////////////////////////////////////


module LEGv8ALUwithControl(
    input [1:0] ALUOp,
    input [10:0] Opcode_field,
    input [63:0] A, B,
    output [63:0] ALU_result,
    output Zero
    );
    wire [3:0] ALU_operation;
    
    //instantiate both ALU and ALU Control
    LEGv8ALU_control ALU_ctrl (.ALU_op(ALUOp), .Opcode_field(Opcode_field), .ALU_operation(ALU_operation)); //ALU Ctrl Unit
    
    LEGv8ALU ALU_unit (.ALU_operation(ALU_operation), .A(A), .B(B), 
    .ALU_result(ALU_result), .Zero(Zero)); //ALU unit
 
 
endmodule
