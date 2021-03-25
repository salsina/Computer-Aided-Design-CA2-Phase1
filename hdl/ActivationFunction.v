`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:05:50 12/19/2020 
// Design Name: 
// Module Name:    ActivationFunction 
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
module ActivationFunction(
    input [15:0] in,
    input ready,
    output reg[15:0] out
    );
	 always@(ready)begin
		 if(ready)begin
			if (in[15] == 1'b1)
				out = 16'b0;
			else begin
				if (in > 16'b0) out = in;
				else out = 16'b0;
			end
		 end
	 end
endmodule
