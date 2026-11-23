`timescale 1ns / 1ps
`default_nettype none

/*
 * Biomedical Diagnostic Digital Logic Coprocessor
 * Module / Component: TemperatureAbnormalityDetector
 */

module TemperatureAbnormalityDetector(
        factoryBaseTemp,
        factoryTempCoef,
        tempSensorValue,
        temperatureAbnormality);
input [7:0] factoryBaseTemp;
input [3:0] factoryTempCoef;
input [3:0] tempSensorValue;
output temperatureAbnormality;

wire [7:0]temperature;

  TemperatureCalculator TemperatureCalculatorUnit(
		.factoryBaseTemp(factoryBaseTemp),
		.factoryTempCoef(factoryTempCoef),
		.tempSensorValue(tempSensorValue),
		.temperature    (temperature)
   		);

	TemperatureAnalyzer TemperatureAnalyzerUnit(
		.temperature           (temperature),
		.temperatureAbnormality(temperatureAbnormality)
		);

endmodule
