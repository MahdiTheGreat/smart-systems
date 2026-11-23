# Biomedical Diagnostic Digital Logic Coprocessor

A specialized hardware coprocessor implemented in **Verilog HDL** using structural digital logic modeling, designed for FPGA deployment to perform real-time patient physiological monitoring and critical condition classification.

## Core Hardware Modules

* **Parity-Checked Sensor Interface (`src/rtl/modules/BloodPressureCircuit.v`):**
  * Real-time noise mitigation on biomedical sensor streams via integrated parity bit checking.
  * Evaluates 5-bit unsigned systolic pressure inputs against dynamic clinical threshold limits ($8-22$), suppressing corrupted transmissions and alerting on hypertensive crises.
* **Blood Group & pH Concentration Evaluator (`src/rtl/modules/BloodPHAnalyzer.v`, `BloodTypeClassification.v`):**
  * Multiplexer-based digital classifier decoding ABO and Rh factor antigen combinations.
  * Dynamically shifts safe pH concentration criteria ($7-8$ baseline vs. expanded $6-9$ for Blood Group O and B+) to identify acidosis and alkalosis conditions.
* **Fall Detection & Postural Comparator (`src/rtl/modules/FallingDetector.v`, `Comparator8Bit.v`):**
  * 8-bit digital magnitude comparator continuously evaluating telemetry from accelerometers and inertial sensors to flag sudden loss-of-balance events.
* **Metabolic & Cardiac Diagnostic Engines:**
  * Structural arithmetic units (`Fulladder_2bit.v`, `Fulladder_4bit.v`, `Fulladder_8bit.v`) calculating Glycemic Index metrics and warning on shock and fever emergencies.
* **Verification:** Comprehensive digital testbench (`src/rtl/benchs/LogicHealthcareSystemTestBench.v`) verifying functional timing and fault isolation.
