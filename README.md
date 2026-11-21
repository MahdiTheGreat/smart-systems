# Smart Systems & Embedded Engineering Monorepo

A unified engineering monorepo containing embedded firmware, IoT prototypes, microprocessor systems, and low-level assembly algorithms. All subprojects are verified through interactive Proteus circuit simulation and hardware prototyping, preserving full Git commit history.

## Monorepo Projects

### 1. IoT & Intelligent Systems
* **[smartParking](projects/smartParking/)**: Multi-bay parking lot management system with ultrasonic/infrared occupancy sensing, gate barrier servo control, and LCD occupancy telemetry.
* **[smartWasteBin](projects/smartWasteBin/)**: Touchless hygienic waste receptacle featuring contactless ultrasonic proximity detection and servo-driven lid actuation.
* **[smartFarming](projects/smartFarming/)**: Automated greenhouse system featuring closed-loop soil moisture irrigation control and integrated optical flame sensor hazard detection.
* **[smartScreen](projects/smartScreen/)**: Adaptive ambient light display dimmer utilizing LDR voltage division and dynamic 8-bit PWM backlight modulation.
* **[attendanceCheck](projects/attendanceCheck/)**: Automated classroom attendance terminal with matrix keypad authentication and 10-minute late-cutoff logging.

### 2. Microprocessor & Embedded Firmware Suite
* **[MicroprocessorProjects](projects/MicroprocessorProjects/)**: 9 modular embedded hardware and firmware systems:
  * Distributed multi-node **SPI bus telemetry** across master and multiple slave MCUs.
  * Fault-tolerant automated controller with non-volatile **TWI / I2C EEPROM state persistence**.
  * 12-channel automated vending machine servo dispenser with administrative passcode override.
  * Matrix keypad integer calculator and alphanumeric 16x2 LCD bus drivers (4-bit/8-bit).
  * Piezoelectric frequency tone synthesizer with potentiometer pitch shifting.
  * Transistorized relay switching circuits with inductive flyback protection.

### 3. Low-Level Architecture & Assembly
* **[assembelyCodes](projects/assembelyCodes/)**: Low-level algorithms written in ARM assembly (validated on Keil $\mu$Vision & VisUAL):
  * Pointer arithmetic, indexed array traversal, and two's complement arithmetic.
  * Software-implemented multiplication and division/modulo restoring algorithms.
  * Power-of-two and general exponentiation with condition flag management.

---

## Technical Stack & Tooling
* **Target Architectures:** Atmel AVR (ATmega2560), ARM Cortex-M / ARMv7 ISA.
* **Languages & Firmware:** Embedded C/C++, ARM Assembly.
* **Protocols & Interfaces:** SPI (Master/Multi-Slave), TWI / $\text{I}^2\text{C}$, Parallel LCD (4-bit / 8-bit), ADC, PWM, EEPROM.
* **Simulation & Design:** Proteus VSM Circuit Simulation, Keil $\mu$Vision, Arduino IDE, VisUAL.
