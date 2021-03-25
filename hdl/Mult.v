`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:53:12 12/19/2020 
// Design Name: 
// Module Name:    Mult 
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
module Mult(
	 input clk,
    input[7:0] A,
    input[7:0] B,
    output reg[15:0] out
    );
	 	initial begin
		out = 16'b0;
		end
		
	 wire sign;
	 wire[15:0]temp_out;
	 wire[7:0] m0_out,m1_out,m2_out,m3_out,m0_final,m1_final,m2_final,m3_final;
	 Mult4 m0({1'b0,A[2:0]},{1'b0,B[2:0]},m0_out);	 
	 Mult4 m1({1'b0,A[2:0]},{1'b0,B[6:4]},m1_out);
	 Mult4 m2({1'b0,A[6:4]},{1'b0,B[2:0]},m2_out);
	 Mult4 m3({1'b0,A[6:4]},{1'b0,B[6:4]},m3_out);
	
	xor xor1(sign,A[7],B[7]);
	assign temp_out = {8'b0,m0_out} + {4'b0,m1_out,4'b0} + {4'b0,m2_out,4'b0} + {m3_out,8'b0} ;
	always@(posedge clk)begin
		out <= {sign,temp_out[14:0]};
	end
		

endmodule
