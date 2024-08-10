`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/24/2021 11:30:39 PM
// Design Name: 
// Module Name: LEGv8ALU-tb
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


module LEGv8ALU_tb(

    );
   
    //Inputs
    reg [3:0] ALU_operation;
    reg [63:0] A, B;
    
    //Outputs
    wire [63:0] ALU_result;
    wire Zero;
    
    //Instantiate UUT
    LEGv8ALU uut(
        .ALU_operation(ALU_operation),
        .A(A), .B(B),
        .ALU_result(ALU_result),
        .Zero(Zero)
        );//end UUT
    
    //Begin Stimulus
    initial 
      begin
      
      //Step 1 : Initialization
      ALU_operation = 4'h0; A = 64'd0; B = 64'd0; //Expected result: 64'd0 & Zero = 1'b1;
                
      //Step 2: Wait for 100ns for global reset
      #100;
                
      //Step 3: Commence Tests via Stimulus
      #100 ALU_operation = 4'h0; A = 64'h5555555555555555; B = 64'haaaaaaaaaaaaaaaa; //AND operation
      //expected result: 64'd0; Zero = 1'b1;
      #100 ALU_operation = 4'h1; //OR operation
      //expected result: 64'dFFFF FFFF FFFF FFFF; Zero = 1'b0;
      #100 ALU_operation = 4'h2; //ADD operation
      //expected result: 64'dFFFF FFFF FFFF FFFF; Zero = 1'b0;
      #100 ALU_operation = 4'h6; //SUB operation
      //expected result: 64'dAAAA AAAA AAAA AAAB; (64'd: -5) Zero = 1'b0;
      #100 ALU_operation = 4'h7; //PASS B operation
      //expected result: 64'dAAAA AAAA AAAA AAAA; Zero = 1'b0;
      #100 ALU_operation = 4'hC; //NOR operation
      //expected result: 64'd0; Zero = 1'b1;
     
      //Step 4: Global Reset @ Stimulation Finish
      #100 ALU_operation = 4'h0; A = 64'd0; B = 64'd0; //Expected result: 64'd0 & Zero = 1'b1;
     end//end stimulation
    
endmodule
