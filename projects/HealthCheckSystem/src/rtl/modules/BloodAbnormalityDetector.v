`timescale 1ns / 1ps
`default_nettype none

/*
 * Biomedical Diagnostic Digital Logic Coprocessor
 * Module / Component: BloodAbnormalityDetector
 */

module BloodAbnormalityDetector(
        bloodPH,
        bloodType,
        bloodAbnormality);
input [3:0] bloodPH;
input [2:0] bloodType;
output bloodAbnormality;

wire  abnormalityP, abnormalityQ, bloodClass;

 	BloodPHAnalyzer BloodPHAnalyzerUnit(
        bloodPH,
        abnormalityP,
        abnormalityQ
        );

 	BloodTypeClassification BloodTypeClassificationUnit(
 		.bloodType (bloodType),
 		.bloodClass(bloodClass)
 		);
    
    assign bloodAbnormality = (bloodClass) ? abnormalityQ : abnormalityP;


endmodule
