`timescale 1ns / 1ps
`default_nettype none

/*
 * Biomedical Diagnostic Digital Logic Coprocessor
 * Module / Component: PressureAbnormalityDetector
 */

module PressureAbnormalityDetector(
        pressureData,
        presureAbnormality);

input [5:0] pressureData;
output presureAbnormality;

wire error, pWarning;


	ParityErrorChecker ParityErrorCheckerUnit 
	(
		.data (pressureData),
		.error(error)
    );

    PressureAnalyzer PressureAnalyzerUnit
    (
        pressureData[4],
		  pressureData[3],
		  pressureData[2],
		  pressureData[1],
		  pressureData[0],
		  pWarning
    );

    assign presureAbnormality = (~error) & pWarning;

endmodule
