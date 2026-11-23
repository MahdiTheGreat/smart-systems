`timescale 1ns / 1ps
`default_nettype none

/*
 * Biomedical Diagnostic Digital Logic Coprocessor
 * Module / Component: AbsoluteCalculator
 */

module AbsoluteCalculator(
	signedNumber,
	absoluteNumber
    );
input [7:0]signedNumber;
output [7:0]absoluteNumber; 
wire cout;

	Fulladder_8bit absolute(8'b0, signedNumber, signedNumber[7], absoluteNumber, cout);
	
endmodule
