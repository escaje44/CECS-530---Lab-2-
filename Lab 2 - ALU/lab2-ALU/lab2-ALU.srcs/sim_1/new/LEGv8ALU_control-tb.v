`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineer: Jeremy Escamilla
// 
// Create Date: 08/24/2021 11:30:39 PM
// Design Name: ALU Control Unity
// Module Name: LEGv8ALU_control-tb
// Project Name: Lab 2 - ALU 
//
// Description: 
//   Properly test for potential logic errors and test for desired ouptuts corresponding to potential inputs.
// Dependencies: 
//   Requires Legv8ALU_control to test
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LEGv8ALU_control_tb(

    );
    
     //Inputs
     reg [1:0] ALU_op;
     reg [10:0] Opcode_field;
       
     //Outputs
     wire [3:0] ALU_operation;
     
     //Instantiate UUT
     LEGv8ALU_control uut(
         .ALU_op(ALU_op),
         .Opcode_field(Opcode_field),
         .ALU_operation(ALU_operation)
      );//End UUT
      
      initial
       begin
          //Step 1 : Initialization
          ALU_op = 2'd0; Opcode_field = 11'd0;
          
          //Step 2: Wait for 100ns for global reset
          #100;
          
          //Step 3: Commence Tests via Stimulus
          //   Test for matching output to corresponding inputs
          #100 ALU_op = 2'd00; Opcode_field = 11'h000; //expect 1100 (C)
          #100 Opcode_field = 11'h458; #100 Opcode_field = 11'h658; 
          #100 Opcode_field = 11'h450; #100 Opcode_field = 11'h550;//result should stay the same
          #100 ALU_op = 2'd01; Opcode_field = 11'h000; //expect 0111 (7)
          #100 Opcode_field = 11'h458; #100 Opcode_field = 11'h658; 
          #100 Opcode_field = 11'h450; #100 Opcode_field = 11'h550;//result should stay the same
          #100 ALU_op = 2'd10; Opcode_field = 11'h458; //expect 0010 (2)
          #100 ALU_op = 2'd11; //result should stay the same
          #100 ALU_op = 2'd10; Opcode_field = 11'h658; //expect 0110 (6)
          #100 ALU_op = 2'd11; //result should stay the same
          #100 ALU_op = 2'd10; Opcode_field = 11'h450; //expect 0000 (0)
          #100 ALU_op = 2'd11; //result should stay the same
          #100 ALU_op = 2'd10; Opcode_field = 11'h550; //expect 0001 (1)
          #100 ALU_op = 2'd11; //result should stay the same
          
          //Step 4: Global Reset @ Stimulation Finish
          #100 ALU_op = 2'd0; Opcode_field = 11'h000;
       end //end initial
endmodule