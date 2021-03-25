`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:55 12/19/2020 
// Design Name: 
// Module Name:    MAC 
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
module MAC2(
	input [7:0] bias,
	input ld_reg,inc,
	input[7:0] A,
	input[7:0] B,
	input clk,
	input init,
	output[15:0] out
    );
	 wire [13:0] mult_out_ipcore;
	wire [15:0] mult_out,add_out;
	mult_IPCore mult (.clk(clk),.a(A[6:0]), .b(B[6:0]), .p(mult_out_ipcore) );
	wire xor_out;
	xor xor1(xor_out,A[7],B[7]);
	assign mult_out = {xor_out,1'b0,mult_out_ipcore};
	//Mult mult(clk,A,B,mult_out);
	Adder adder(mult_out,out,add_out);
	Reg15 register15(bias,ld_reg,add_out,clk,init,out);

endmodule
