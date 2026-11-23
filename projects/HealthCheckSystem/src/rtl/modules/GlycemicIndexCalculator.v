`timescale 1ns / 1ps
`default_nettype none

/*
 * Biomedical Diagnostic Digital Logic Coprocessor
 * Module / Component: GlycemicIndexCalculator
 */

module GlycemicIndexCalculator(
        bloodSensor,
        glycemicIndex);
input [7:0] bloodSensor;
output [3:0] glycemicIndex;
wire [7:0] absoluteNumber;

	AbsoluteCalculator g0(bloodSensor, absoluteNumber);
	CountingOnes g1(absoluteNumber, glycemicIndex);

endmodule