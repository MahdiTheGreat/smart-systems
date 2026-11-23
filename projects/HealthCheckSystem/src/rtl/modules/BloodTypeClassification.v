`timescale 1ns / 1ps
`default_nettype none

/*
 * Biomedical Diagnostic Digital Logic Coprocessor
 * Module / Component: BloodTypeClassification
 */

module BloodTypeClassification(
        bloodType,
        bloodClass);
input [2:0] bloodType;
output bloodClass;

	Mux_4_1 multiplexer(1'b1, 1'b0, bloodType[0], 1'b0, 1'b1, bloodType[1], bloodType[2], bloodClass);
endmodule
