`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:55:41 12/19/2020 
// Design Name: 
// Module Name:    Reg15 
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
module Reg15(
	input[7:0] bias,
	input ld_reg,
    input[15:0] in,
    input clk,
    input init,
    output reg[15:0] out
    );
	always@(posedge clk)begin
		if (init)begin
			if(bias[7] == 1'b0)
				out <= {8'b0,bias};
			else 
				out <= {8'b11111111,bias};
			end
		else begin
			if(ld_reg)
				out <= in;
			end
	end
endmodule
