`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
module fixedFloatConversion(
  input wire clk, 
  input wire rst , 
  input wire[31:0] targetnumber, 
  input wire[4:0] fixpointpos , 
  input wire opcode , // 1 is float to fix, 0 is fix to float
  output wire[31:0] result );

wire [31:0] floatresult ; 
wire [31:0] fixresult ; 


// -------------------------------------------
// From fix to float (Part 1)
// -------------------------------------------
// Your  Implementation 

fixedfloatconversion uut (
	.clk(clk), 
	.rst(rst), 
	.targetnumber(targetnumber), 
	.fixpointpos(fixpointpos), 
	.opcode(opcode), 
	.result(result)
);

initial begin	
	clk = 0; rst =1 ; #50;
	clk = 1; rst =1 ; #50;
	clk = 0; rst =0 ; #50;
	clk = 1; rst =0 ; #50;
forever begin 
	clk = ~clk; #50; 
end 
end 	  

initial begin

opcode=1’b000

fixpointpos=4'b0000; 
targetnumber={32'h0}; 
R={32'h0}; 
#100; 

//1st test

fixpointpos=5’b11001;
targetnumber={{12'b0011001_01000},{20'h00000}}; 
R=32'b0_10000011_10010100000000000000000;
#100

$display("TC01 Fixpoint to floatpoint",R,result); 
if(R==result) $display("Correct Result",R,result);
if(R!=result) $display("Incorrect Result",R,result);

//2nd test
fixpointpos=5'b0001;
targetnumber={{20'h00000},{12'h400}}; 
R=32'b0_10001000_00000000000000000000000;
#100

$display("TC02 Fixpoint to floatpoint",R,result); 
if(R==result) $display("Correct Result",R,result);
if(R!=result) $display("Incorrect Result",R,result);

//3rd test
opcode=1'b0; 
fixpointpos=5'b0001;
targetnumber={{20'h00000},{12'h400}}; 
R=32'b0_10001000_00000000000000000000000;
#100

$display("TC03 Fixpoint to floatpoint",R,result); 
if(R==result) $display("Correct Result",R,result);
if(R!=result) $display("Incorrect Result",R,result);
// -------------------------------------------	
// From float to fix (Part 2)
// -------------------------------------------
// Your  Implementation  
opcode=1'b010;
//1st test

fixpointpos=5’b11001;
targetnumber=32'b0_10000011_10010100000000000000000;
R={{12'b0011001_01000},{20'h00000}};
#100

$display("TC01 Floatpoint to fixpoint",R,result); 
if(R==result) $display("Correct Result",R,result);
if(R!=result) $display("Incorrect Result",R,result);

//2nd test
fixpointpos=5'b0001;
targetnumber=32'b0_10001000_00000000000000000000000;
R={{20'h00000},{12'h400}}; 
#100

$display("TC02 Floatpoint to fixpoint",R,result); 
if(R==result) $display("Correct Result",R,result);
if(R!=result) $display("Incorrect Result",R,result);

//3rd test
opcode=1'b0; 
fixpointpos=5'b0001;
targetnumber=32'b0_10001000_00000000000000000000000;
R={{20'h00000},{12'h400}}; 
#100

$display("TC03 Floatpoint to fixpoint",R,result); 
if(R==result) $display("Correct Result",R,result);
if(R!=result) $display("Incorrect Result",R,result);

always @ ( posedge clk ) begin 
    // Synchronous reset
    result <= opcode == 1 ?  fixresult : floatresult ;

end 
endmodule


