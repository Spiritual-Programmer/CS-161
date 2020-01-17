`timescale 1ns / 1ps

module myalutb;

	parameter NUMBITS = 8 ;

	// Inputs
	reg clk ;
	reg reset ; 
	reg [NUMBITS-1:0] A;
	reg [NUMBITS-1:0] B;
	reg [2:0] opcode;

	// Outputs
	
	wire [NUMBITS-1:0] result;
	reg [NUMBITS-1:0] R ;
	wire carryout;
	wire overflow;
	wire zero;

   // -------------------------------------------------------
	// Instantiate the Unit Under Test (UUT)
	// -------------------------------------------------------
	
	my_alu #(NUMBITS) uut (
	   .clk(clk),
		.reset(reset) ,  
		.A(A), 
		.B(B), 
		.opcode(opcode), 
		.result(result), 
		.carryout(carryout), 
		.overflow(overflow), 
		.zero(zero)
	);

  	initial begin 
	
	 clk = 0 ; reset = 1 ; #50 ; 
	 clk = 1 ; reset = 1 ; #50 ; 
	 clk = 0 ; reset = 0 ; #50 ; 
	 clk = 1 ; reset = 0 ; #50 ; 
		 
	 forever begin 
		clk = ~clk; #50 ; 
	 end 
	 
	end 
	
	initial begin
		
		// ---------------------------------------------
		// Testing unsigned additions 
		// --------------------------------------------- 
		opcode = 3'b000 ; 
		
		//Test 1
		A = 4'hFF ;
   	B = 4'h01 ;
		R = 4'h00 ; 
		
	    #100 ; // Wait 
     
		$display("TC01 Unsigned Add ");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (carryout != 1'b1) $display ("Carryout is wrong");
		if (carryout == 1'b1) $display ("Carryout is right");
		
		//Test 2
		A = 4'h01 ;
   	B = 4'h00 ;
		R = 4'h01 ; 
		
	    #100 ; // Wait 
     
		$display("TC02 Unsigned Add ");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (carryout != 1'b1) $display ("Carryout is wrong");
		if (carryout == 1'b1) $display ("Carryout is right");
		
		//Test 3
		A = 4'hF0 ;
   	B = 4'h0F ;
		R = 4'hFF ; 
		
	    #100 ; // Wait 
     
		$display("TC03 Unsigned Add ");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (carryout != 1'b1) $display ("Carryout is wrong");
		if (carryout == 1'b1) $display ("Carryout is right");
		
		
		// ---------------------------------------------
		// Testing unsigned subs 
		// --------------------------------------------- 
		opcode = 3'b010 ; 
		
		//Test 1
		A = 4'hFF ;
   	B = 4'h01 ;
		R = 4'hFE ; 
		
	    #100 ; // Wait 
     
		$display("TC01 Unsigned Sub ");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (carryout != 1'b1) $display ("Carryout is wrong");
		if (carryout == 1'b1) $display ("Carryout is right");
		
		//Test 2
		A = 4'h01 ;
   	B = 4'h00 ;
		R = 4'h01 ; 
		
	    #100 ; // Wait 
     
		$display("TC02 Unsigned Sub ");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (carryout != 1'b1) $display ("Carryout is wrong");
		if (carryout == 1'b1) $display ("Carryout is right");
		
		//Test 3
		A = 4'hF0 ;
   	B = 4'h0F ;
		R = 4'hE1 ; 
		
	    #100 ; // Wait 
     
		$display("TC03 Unsigned Sub ");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (carryout != 1'b1) $display ("Carryout is wrong");
		if (carryout == 1'b1) $display ("Carryout is right");
		// ---------------------------------------------
		// Testing signed adds 
		// --------------------------------------------- 
		opcode = 3'b001 ; 
		
		//Test 1
		A = $signed(4'hF0) ;
   	B = $signed(4'h01) ;
		R = $signed(4'hF1) ; 
		
	    #100 ; // Wait 
     
		$display("TC01 Signed Add ");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (overflow != 1'b1) $display ("Overflow is wrong");
		if (overflow == 1'b1) $display ("Overflow is right");
		
		//Test 2
		
		A = $signed(4'h01) ;
   	B = $signed(4'h00) ;
		R = $signed(4'h01) ; 
		
	    #100 ; // Wait 
     
		$display("TC02 Signed Add ");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (overflow != 1'b1) $display ("Overflow is wrong");
		if (overflow == 1'b1) $display ("Overflow is right");
		
		//Test 3
		A = $signed(4'hF0) ;
   	B = $signed(4'h0F) ;
		R = $signed(4'hFF) ; 
		
	    #100 ; // Wait 
     
		$display("TC03 Signed Add ");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (overflow != 1'b1) $display ("Overflow is wrong");
		if (overflow == 1'b1) $display ("Overflow is right");
		// ---------------------------------------------
		// Testing signed subs 
		// --------------------------------------------- 
		opcode = 3'b011 ; 
		
		//Test 1
		A = $signed(4'hFF) ;
   	B = $signed(4'h01) ;
		R = $signed(4'hFE) ; 
		
	    #100 ; // Wait 
     
		$display("TC01 Signed Sub ");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (overflow != 1'b1) $display ("Overflow is wrong");
		if (overflow == 1'b1) $display ("Overflow is right");
		
		//Test 2
		A = $signed(4'h01) ;
   	B = $signed(4'h00) ;
		R = $signed(4'h01) ; 
		
	    #100 ; // Wait 
     
		$display("TC02 SignedSub ");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (overflow != 1'b1) $display ("Overflow is wrong");
		if (overflow == 1'b1) $display ("Overflow is right");
		
		//Test 3
		A = $signed(4'hF0) ;
   	B = $signed(4'h0F) ;
		R = $signed(4'hE1) ; 
		
	    #100 ; // Wait 
     
		$display("TC03 Signed Sub ");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (overflow != 1'b1) $display ("Overflow is wrong");
		if (overflow == 1'b1) $display ("Overflow is right");
		// ---------------------------------------------
		// Testing ANDS 
		// --------------------------------------------- 
		opcode = 3'b100 ; 
		
		//Test 1
		A = 4'hFF ;
   	B = 4'h00 ;
		R = 4'h00 ; 
		
	    #100 ; // Wait 
     
		$display("TC01 And");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (carryout != 1'b1) $display ("Carryout is wrong");
		if (carryout == 1'b1) $display ("Carryout is right");
		if (overflow != 1'b1) $display ("Overflow is wrong");
		if (overflow == 1'b1) $display ("Overflow is right");
		
		//Test 2
		
		A = 4'hF0 ;
   	B = 4'hFF ;
		R = 4'hF0 ; 
		
	    #100 ; // Wait 
     
		$display("TC02 And");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (carryout != 1'b1) $display ("Carryout is wrong");
		if (carryout == 1'b1) $display ("Carryout is right");
		if (overflow != 1'b1) $display ("Overflow is wrong");
		if (overflow == 1'b1) $display ("Overflow is right");
		
		//Test 3
		A = 4'hFF ;
   	B = 4'hFF ;
		R = 4'hFF ; 
		
	    #100 ; // Wait 
     
		$display("TC03 And");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (carryout != 1'b1) $display ("Carryout is wrong");
		if (carryout == 1'b1) $display ("Carryout is right");
		if (overflow != 1'b1) $display ("Overflow is wrong");
		if (overflow == 1'b1) $display ("Overflow is right");
		// ----------------------------------------
		// ORs 
		// ---------------------------------------- 
		opcode = 3'b101 ; 
		
		//Test 1
		A = 4'hFF ;
   	B = 4'h00 ;
		R = 4'hFF ; 
		
	    #100 ; // Wait 
     
		$display("TC01 Or");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (carryout != 1'b1) $display ("Carryout is wrong");
		if (carryout == 1'b1) $display ("Carryout is right");
		if (overflow != 1'b1) $display ("Overflow is wrong");
		if (overflow == 1'b1) $display ("Overflow is right");
		
		//Test 2
		
		A = 4'h0F ;
   	B = 4'h00 ;
		R = 4'h0F ; 
		
	    #100 ; // Wait 
     
		$display("TC02 Or");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (carryout != 1'b1) $display ("Carryout is wrong");
		if (carryout == 1'b1) $display ("Carryout is right");
		if (overflow != 1'b1) $display ("Overflow is wrong");
		if (overflow == 1'b1) $display ("Overflow is right");
		
		//Test 3
		A = 4'hAF ;
   	B = 4'h0F ;
		R = 4'hAF ; 
		
	    #100 ; // Wait 
     
		$display("TC03 Or");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (carryout != 1'b1) $display ("Carryout is wrong");
		if (carryout == 1'b1) $display ("Carryout is right");
		if (overflow != 1'b1) $display ("Overflow is wrong");
		if (overflow == 1'b1) $display ("Overflow is right");
		// ----------------------------------------
		// XORs 
		// ---------------------------------------- 
		opcode = 3'b110 ; 
		
		//Test 1
		A = 4'hF0 ;
   	B = 4'h0F ;
		R = 4'hFF ; 
		
	    #100 ; // Wait 
     
		$display("TC01 Xor");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (carryout != 1'b1) $display ("Carryout is wrong");
		if (carryout == 1'b1) $display ("Carryout is right");
		if (overflow != 1'b1) $display ("Overflow is wrong");
		if (overflow == 1'b1) $display ("Overflow is right");
		
		//Test 2
		
		A = 4'hFF ;
   	B = 4'hFF ;
		R = 4'h00 ; 
		
	    #100 ; // Wait 
     
		$display("TC02 Xor");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (carryout != 1'b1) $display ("Carryout is wrong");
		if (carryout == 1'b1) $display ("Carryout is right");
		if (overflow != 1'b1) $display ("Overflow is wrong");
		if (overflow == 1'b1) $display ("Overflow is right");
		
		//Test 3
		A = 4'h01 ;
   	B = 4'h10 ;
		R = 4'h11 ; 
		
	    #100 ; // Wait 
     
		$display("TC03 Xor");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (carryout != 1'b1) $display ("Carryout is wrong");
		if (carryout == 1'b1) $display ("Carryout is right");
		if (overflow != 1'b1) $display ("Overflow is wrong");
		if (overflow == 1'b1) $display ("Overflow is right");
		// ----------------------------------------
		// Div 2 
		// ----------------------------------------
		opcode = 3'b111 ; 
		
		//Test 1
		A = 4'hF0 ;
		R = 4'h7F ; 
		
	    #100 ; // Wait 
     
		$display("TC01 Div 2");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (carryout != 1'b1) $display ("Carryout is wrong");
		if (carryout == 1'b1) $display ("Carryout is right");
		if (overflow != 1'b1) $display ("Overflow is wrong");
		if (overflow == 1'b1) $display ("Overflow is right");
		
		//Test 2
		
		A = 4'hFF ;
		R = 4'h7F ; 
		
	    #100 ; // Wait 
     
		$display("TC02 Div 2");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (carryout != 1'b1) $display ("Carryout is wrong");
		if (carryout == 1'b1) $display ("Carryout is right");
		if (overflow != 1'b1) $display ("Overflow is wrong");
		if (overflow == 1'b1) $display ("Overflow is right");
		
		//Test 3
		A = 4'h01 ;
		R = 4'h00 ; 
		
	    #100 ; // Wait 
     
		$display("TC03 Div 2");
		if (R != result) $display  ("Result is wrong");
		if (R == result) $display  ("Result is right");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (zero == 1'b1) $display ("Zero  is right");
		if (carryout != 1'b1) $display ("Carryout is wrong");
		if (carryout == 1'b1) $display ("Carryout is right");
		if (overflow != 1'b1) $display ("Overflow is wrong");
		if (overflow == 1'b1) $display ("Overflow is right");
	end
      
endmodule

