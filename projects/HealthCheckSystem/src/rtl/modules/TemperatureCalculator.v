`timescale 1ns / 1ps
`default_nettype none

/*
 * Biomedical Diagnostic Digital Logic Coprocessor
 * Module / Component: TemperatureCalculator
 */

module TemperatureCalculator(
        factoryBaseTemp,
        factoryTempCoef,
        tempSensorValue,
        temperature);
input [7:0] factoryBaseTemp;
input [3:0] factoryTempCoef;
input [3:0] tempSensorValue;
output [7:0] temperature;
wire [7:0] p;
wire cout;

	Multiplier multiplier(tempSensorValue, factoryTempCoef, p);
	Fulladder_8bit adder(factoryBaseTemp, {"000", p[7:3]}, 0, temperature, cout);

endmodule
