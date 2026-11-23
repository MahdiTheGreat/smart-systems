`timescale 1ns / 1ps
`default_nettype none

/*
 * Biomedical Diagnostic Digital Logic Coprocessor
 * Module / Component: TemperatureAnalyzer
 */

module TemperatureAnalyzer(
        temperature,
        temperatureAbnormality);
input [7:0] temperature;
output temperatureAbnormality;

	assign temperatureAbnormality = (temperature > 39) || (temperature < 35);

endmodule
