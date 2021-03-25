`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:50:00 12/19/2020 
// Design Name: 
// Module Name:    Adder 
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
module Adder(
    input[15:0] A,
    input[15:0] B,
    output reg[15:0] out
    );
	 initial begin
	 out = 16'b0;
	 end
	always@(A,B)begin
		if(A[15] == 1'b1 && B[15] == 1'b1)begin
			out = {1'b1,(A[14:0]+B[14:0])};
		end
		else if(A[15] == 1'b0 && B[15] == 1'b0)begin
			out = {1'b0,(A[14:0]+B[14:0])};
		end
		else begin
			if(A[15] == 1'b1)begin
				if(A[14:0] > B[14:0])
					out = {1'b1,(A[14:0]-B[14:0])};
				else 
					out = {1'b0,(B[14:0]-A[14:0])};
			end
			
			else begin
				if(B[14:0] > A[14:0])
					out = {1'b1,(B[14:0]-A[14:0])};
				else 
					out = {1'b0,(A[14:0]-B[14:0])};
			end
		end
	end

endmodule
