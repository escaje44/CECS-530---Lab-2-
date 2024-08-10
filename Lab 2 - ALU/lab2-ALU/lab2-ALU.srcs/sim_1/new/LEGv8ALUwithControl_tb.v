`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2021 02:20:22 PM
// Design Name: 
// Module Name: LEGv8ALUwithControl_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LEGv8ALUwithControl_tb(

    );
    
    //inputs
    reg [1:0] ALUOp;
    reg [10:0] Opcode_field;
    reg [63:0] A, B;
    
    //outputs
    wire [63:0] ALU_result;
    wire Zero;
    
    LEGv8ALUwithControl uut(
        .ALUOp(ALUOp),
        .Opcode_field(Opcode_field),
        .A(A), .B(B),
        .ALU_result(ALU_result),
        .Zero(Zero)
     );
     initial
        begin
        //Step 1 : Initialization
        ALUOp = 2'd0; Opcode_field = 11'd0;
         A = 64'd0; B = 64'd0;
        //expected result: 64'd0; Zero = 1'b1;
        
        //Step 2: Wait for 100ns for global reset
        #100;
        
        //Step 3: Commence Tests via Stimulus
        
        #100 ALUOp = 2'd00; Opcode_field = 11'h000; //expect 1100 (C) NOR
        A = 64'h5555555555555555; B = 64'haaaaaaaaaaaaaaaa; //initialize A & B Operands
        #100 Opcode_field = 11'h458; #100 Opcode_field = 11'h658; 
        #100 Opcode_field = 11'h450; #100 Opcode_field = 11'h550;//result should stay the same
        //expected result: 64'd0; Zero = 1'b1;
        
        #100 ALUOp = 2'd01; Opcode_field = 11'h000; //expect 0111 (7) PASS INPUT B
        #100 Opcode_field = 11'h458; #100 Opcode_field = 11'h658; 
        #100 Opcode_field = 11'h450; #100 Opcode_field = 11'h550;//result should stay the same
        //expected result: 64'dAAAA AAAA AAAA AAAA; Zero = 1'b0;
        
        #100 ALUOp = 2'd10; Opcode_field = 11'h458; //expect 0010 (2) ADD
        #100 ALUOp = 2'd11; //result should stay the same
        //expected result: 64'dFFFF FFFF FFFF FFFF; Zero = 1'b0;
        
        #100 ALUOp = 2'd10; Opcode_field = 11'h658; //expect 0110 (6) SUB
        #100 ALUOp = 2'd11; //result should stay the same
        //expected result: 64'dAAAA AAAA AAAA AAAB; (64'd: -5) Zero = 1'b0;
        
        #100 ALUOp = 2'd10; Opcode_field = 11'h450; //expect 0000 (0) AND
        #100 ALUOp = 2'd11; //result should stay the same
        //expected result: 64'd0; Zero = 1'b1;
        
        #100 ALUOp = 2'd10; Opcode_field = 11'h550; //expect 0001 (1) OR
        #100 ALUOp = 2'd11; //result should stay the same
        //expected result: 64'dFFFF FFFF FFFF FFFF; Zero = 1'b0;
                  
        //Step 4: Global Reset @ Stimulation Finish
        #100 ALUOp = 2'd0; Opcode_field = 11'h000;
        //expected result: 64'd0; Zero = 1'b1;
        end
endmodule
