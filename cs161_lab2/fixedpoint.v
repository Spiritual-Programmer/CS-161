`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:56:10 01/24/2020 
// Design Name: 
// Module Name:    fixedpoint 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module fixedpoint(
  input wire clk, 
  input wire rst , 
  input wire[31:0] targetnumber, 
  input wire[4:0] fixpointpos , 
  input wire opcode , // 1 is float to fix, 0 is fix to float
  output reg[31:0] result 
    );

reg [31:0] floatresult ; 
reg [31:0] fixresult ;
reg [31:0] temp_output;
reg [31:0] exponent = 0;
reg [31:0] temp_targetnumber = 0;
reg[4:0] position =0;
reg [31:0] fraction = 0;
reg [31:0] tmp;
reg sign = 0;
integer count;
integer i;

// -------------------------------------------
// From fix to float (Part 1)
// -------------------------------------------
// Your  Implementation 



if (targetnumber & 64'h80000000 ==0) begin
	//sign = 0;
	end
	

// -------------------------------------------	
// From float to fix (Part 2)
// -------------------------------------------
// Your  Implementation  
	opcode=1'b010;

begin
	sign = a[31];
	exp2 = a[30:23]-127;
	fraction = a[31:0];
	count = 23-(exp2+position);
	
	if (count>0)
	
		begin
			tmp = tmp >> count;
		end
	
	else if (count <=0)
	
		begin
			tmp = tmp << -count;
		end
		
		if (sign == 1'b1)
		begin
		tmp = -tmp;
		end
		
		fixresult = tmp;
		end
		endcase
end




// -------------------------------------------	
// Register the results 
// -------------------------------------------

always @ ( posedge clk ) begin 
    // Synchronous reset
    result <= opcode == 1 ?  fixresult : floatresult ;

end 

endmodule


