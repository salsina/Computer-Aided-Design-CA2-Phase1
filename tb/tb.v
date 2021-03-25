`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:31:45 12/21/2020
// Design Name:   ANN
// Module Name:   C:/Users/Sina/Desktop/cadise/cadtest/tb.v
// Project Name:  cadtest
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ANN
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb#(parameter n =5);

	 reg [0:n*8-1] InputVec;
    reg [0:n*8-1] WeightVec;
	 reg [7:0]bias;
	 reg start,clk;
    wire [15:0] Result;

	ANN #(n)ann(bias,InputVec,WeightVec,start,clk,Result);
	initial begin
		InputVec = {8'd5,8'd2,8'd1,8'd2,8'd4};
		WeightVec = {8'd6,8'd5,8'd5,8'd2,8'd1};
		bias = 1;
		start = 1;
		clk = 0;
		#10 clk = 1;
		#10 clk = 0;
		start = 0;
		repeat(200)#10 clk = ~clk;
		#100;  
	end
      
endmodule

