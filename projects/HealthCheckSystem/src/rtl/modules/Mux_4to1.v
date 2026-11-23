`timescale 1ns / 1ps
`default_nettype none

/*
 * Biomedical Diagnostic Digital Logic Coprocessor
 * Module / Component: Mux_4to1
 */

module Mux_4to1(
        i0, i1, i2, i3,
        sel0, sel1,
		  Enable,
		  out);

input[1:0] sel0, sel1;
input i0, i1, i2, i3;
input Enable;
output out;

	assign out = Enable & ((sel1 == 0) ? 
	((sel0 == 0) ? i0 : i1)	: 
	((sel0 == 0) ? i2 : i3));

endmodule
