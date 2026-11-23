`timescale 1ns / 1ps
`default_nettype none

/*
 * Biomedical Diagnostic Digital Logic Coprocessor
 * Module / Component: FallingDetector
 */

module FallingDetector(
        fdSensorValue,
        fdFactoryValue,
        fallDetected);
input [7:0] fdSensorValue;
input [7:0] fdFactoryValue;
output fallDetected;

wire pEqualToQ, pGraterGreaterThanQ;
	Comparator8Bit Comparator8BitUnit(
		.inputP             (fdSensorValue),
		.inputQ             (fdFactoryValue),
		.pEqualToQ          (pEqualToQ),
		.pGraterGreaterThanQ(pGraterGreaterThanQ)
		);
   
   assign fallDetected = pEqualToQ | pGraterGreaterThanQ;

endmodule
