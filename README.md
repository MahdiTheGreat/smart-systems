# Smart Systems, Embedded Firmware & Computer Architecture Monorepo

A unified engineering monorepo containing embedded firmware, IoT prototypes, distributed microprocessor networks, digital RTL hardware designs, computer architecture simulators, and low-level assembly algorithms. All subprojects are verified through interactive Proteus circuit simulation, VHDL/Verilog testbenches, and software simulation suites, preserving full Git commit history.

---

## Monorepo Engineering Pillars

### 1. IoT & Intelligent Systems
* **[`smartParking`](projects/smartParking/)**: Multi-bay parking lot management system with ultrasonic and infrared occupancy sensing, gate barrier servo control, and LCD occupancy telemetry.
* **[`smartWasteBin`](projects/smartWasteBin/)**: Touchless hygienic waste receptacle featuring contactless ultrasonic proximity detection and servo-driven lid actuation.
* **[`smartFarming`](projects/smartFarming/)**: Automated greenhouse system featuring closed-loop soil moisture irrigation control and integrated optical flame sensor hazard detection.
* **[`smartScreen`](projects/smartScreen/)**: Adaptive ambient light display dimmer utilizing LDR voltage division and dynamic 8-bit PWM backlight modulation.
* **[`attendanceCheck`](projects/attendanceCheck/)**: Automated classroom attendance terminal with matrix keypad authentication and 10-minute late-cutoff logging.

---

### 2. Distributed Microprocessor Systems & Multi-Protocol Networks
* **[`VotingMachine`](projects/VotingMachine/)**: Heterogeneous multi-protocol distributed electronic voting network integrating **UART**, **SPI**, and **TWI / $\text{I}^2\text{C}$** to poll and aggregate votes from remote voting terminals to a central coordinator with non-volatile EEPROM tally persistence.
* **[`MicroprocessorProjects`](projects/MicroprocessorProjects/)**: 9 modular embedded hardware and firmware systems:
  * Distributed multi-node **SPI bus telemetry** across master and multiple slave MCUs.
  * Fault-tolerant automated controller with non-volatile **TWI / $\text{I}^2\text{C}$ EEPROM state persistence** to survive power interruptions.
  * 12-channel automated vending machine servo dispenser with administrative passcode override.
  * Matrix keypad integer calculator and alphanumeric 16x2 LCD bus drivers (4-bit / 8-bit).
  * Piezoelectric frequency tone synthesizer with potentiometer pitch shifting.
  * Transistorized relay switching circuits with inductive flyback protection.

---

### 3. Digital Logic Design, RTL & Computer Architecture
* **[`HealthCheckSystem`](projects/HealthCheckSystem/)**: Specialized biomedical diagnostic digital coprocessor designed in **Verilog HDL** (structural modeling) for FPGA deployment:
  * Parity-checked sensory interfaces mitigating noise on physiological data.
  * 5-bit unsigned blood pressure evaluation with threshold comparators.
  * Blood group (ABO / Rh) decoder and dynamic pH concentration bounds analyzer.
  * 8-bit digital magnitude comparator for real-time patient fall and balance-loss detection.
  * Hardware arithmetic units for glycemic index calculations and critical condition alerting.
* **[`manoBasicComputer`](projects/manoBasicComputer/)**: Full implementation of the classic M. Morris Mano 16-bit computer architecture in both **VHDL (RTL)** and **Python (cycle-accurate simulator)**:
  * Multi-register common bus interconnect with tri-state controls.
  * 16-bit ALU, 4-bit sequence counter, and decoding logic for micro-operation execution.
  * Complete instruction cycle handling for memory-reference operations (`AND`, `ADD`, `LDA`, `STA`, `BUN`, `BSA`, `ISZ`).
* **[`cacheSimulator`](projects/cacheSimulator/)**: Parameterizable CPU cache memory hierarchy simulator in Python:
  * Models unified (Von Neumann) and split instruction/data (Harvard) cache architectures.
  * Supports direct-mapped, $N$-way set-associative, and fully associative layouts.
  * Evaluates Least Recently Used (LRU) replacement policy via dynamic linked lists and analyzes Write-Through, Write-Back, Write-Allocate, and No-Write-Allocate cache policies.

---

### 4. Low-Level Architecture & Assembly
* **[`assembelyCodes`](projects/assembelyCodes/)**: Low-level algorithms written in ARM assembly (validated on Keil $\mu$Vision & VisUAL):
  * Pointer arithmetic, indexed array traversal, and two's complement arithmetic.
  * Software-implemented multiplication and division/modulo restoring algorithms.
  * Power-of-two and general exponentiation with condition flag management.

---

## Directory Structure

```text
smart-systems/
├── README.md
└── projects/
    ├── assembelyCodes/
    ├── attendanceCheck/
    ├── cacheSimulator/
    ├── HealthCheckSystem/
    ├── manoBasicComputer/
    ├── MicroprocessorProjects/
    ├── smartFarming/
    ├── smartParking/
    ├── smartScreen/
    ├── smartWasteBin/
    └── VotingMachine/
```

---

## Technical Stack & Tooling

* **Architectures:** Atmel AVR (ATmega2560), ARM Cortex-M / ARMv7, Mano 16-Bit Architecture.
* **Hardware Description Languages:** Verilog HDL, VHDL.
* **Firmware & Software:** Embedded C/C++, Python 3, ARM Assembly.
* **Buses & Protocols:** SPI (Full-duplex Master/Multi-Slave), TWI / $\text{I}^2\text{C}$, Hardware UART, Parallel LCD (4-bit / 8-bit), ADC, PWM.
* **EDA & Simulation:** Proteus VSM Circuit Simulation, ModelSim / EDA Playground, Keil $\mu$Vision, Arduino IDE, VisUAL.
