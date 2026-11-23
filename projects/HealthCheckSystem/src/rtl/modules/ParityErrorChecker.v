`timescale 1ns / 1ps
`default_nettype none

/*
 * Biomedical Diagnostic Digital Logic Coprocessor
 * Module / Component: ParityErrorChecker
 */

module ParityErrorChecker(
        data,
        error);
input [5:0] data;
output error;
wire [3:0] wParity;
   
	xor 
	g0(wParity[0], data[0], data[1]),
	g1(wParity[1], wParity[0], data[2]),
	g2(wParity[2], wParity[1], data[3]),
	g3(wParity[3], wParity[2], data[4]),
	g4(error, wParity[3], data[5]);
endmodule

