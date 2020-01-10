`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:30:22 01/10/2020
// Design Name:   fulladder
// Module Name:   /home/csmajs/ksing014/tutorial/fulladder_tb.v
// Project Name:  tutorial
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fulladder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fulladder_tb;

	// Inputs
	reg A;
	reg B;
	reg Cin;

	// Outputs
	wire Sum;
	wire Cout;

	// Instantiate the Unit Under Test (UUT)
	fulladder uut (
		.A(A), 
		.B(B), 
		.Cin(Cin), 
		.Sum(Sum), 
		.Cout(Cout)
	);

	initial begin
		// Initialize Inputs
		A = 0; B = 0; Cin = 1'b0; #100;
		A = 0; B = 1; Cin = 1'b0; #100;
		A = 1; B = 0; Cin = 1'b0; #100;
		A = 1; B = 1; Cin = 1'b0; #100;
		A = 0; B = 0; Cin = 1'b1; #100;
		A = 0; B = 1; Cin = 1'b1; #100;
		A = 1; B = 0; Cin = 1'b1; #100;
		A = 1; B = 1; Cin = 1'b1; #100;

		// the #100 is Wait 100 ns for global reset to finish
        
		// Add stimulus here

	end
      
endmodule

