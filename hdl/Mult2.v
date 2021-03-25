`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:37:55 12/19/2020 
// Design Name: 
// Module Name:    Mult2 
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
module Mult2(
    input [1:0] in1,
    input [1:0] in2,
    output [3:0] out
    ); 
	wire notout1,notout2,notout3,notout4;
	wire and1_0out,and1_1out,and1_2out,and1_3out,and2_0out,and2_1out;

	not not1(notout1,in1[1]);
	not not2(notout2,in1[0]);
	not not3(notout3,in2[1]);
	not not4(notout4,in2[0]);

	and and0(out[0],in1[0],in2[0]);
	and and1_0(and1_0out,in1[1],in2[0],notout3);
	and and1_1(and1_1out,in1[0],in2[1],notout4);
	and and1_2(and1_2out,notout1,in1[0],in2[1]);
	and and1_3(and1_3out,in1[1],notout2,in2[0]);
	and and2_0(and2_0out,in2[1],in1[1],notout2);
	and and2_1(and2_1out,in1[1],in2[1],notout4);
	and and3(out[3],in1[1],in1[0],in2[1],in2[0]);

	or or1(out[1],and1_0out,and1_1out,and1_2out,and1_3out);
	or or2(out[2],and2_0out,and2_1out);


endmodule
