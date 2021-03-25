`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:24:34 12/22/2020 
// Design Name: 
// Module Name:    Mult4 
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
module Mult4(
    input [3:0] A,
    input [3:0] B,
    output [7:0] out
    );
	 wire[3:0] m0_out,m1_out,m2_out,m3_out;
	 Mult2 m0(A[1:0],B[1:0],m0_out);
	 Mult2 m1(A[1:0],B[3:2],m1_out);
	 Mult2 m2(A[3:2],B[1:0],m2_out);
	 Mult2 m3(A[3:2],B[3:2],m3_out);

	assign out = {4'b0,m0_out} + {2'b0,m1_out,2'b0} + {2'b0,m2_out,2'b0} + {m3_out,4'b0} ;
endmodule
