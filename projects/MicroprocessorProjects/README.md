# Microprocessor & Embedded Systems Laboratory

This repository contains the complete laboratory curriculum and implementation for the **Microprocessor Laboratory** course at **Amirkabir University of Technology (Tehran Polytechnic) - Department of Computer Engineering**, based on the official laboratory manual (*دستور کار آزمایشگاه ریزپردازنده*).

The projects are implemented for the **Arduino Mega 2560 (Atmel ATmega2560)** platform, modeled and simulated in **Proteus VSM**, and accompanied by technical laboratory reports and firmware source code.

---

## Laboratory Modules & Implemented Systems

### Lab 1: Getting Started with ATmega2560 & Circuit Simulation (`microProcessorLab1/`)
* **Objective:** Board initialization, input/output port configuration, and Proteus simulation workflow.
* **Hardware & Circuits:** Arduino Mega 2560, LED array, pushbuttons, current-limiting resistors ($220\,\Omega$), pull-up/pull-down resistors ($10\,\text{k}\Omega$).
* **Firmware Logic:** Multi-button state machine:
  * Button 1: Sequentially activates LEDs one by one from left to right.
  * Button 2: Sequentially activates LEDs one by one from right to left.
  * Button 3: Global reset turning off all LEDs.
* **Deliverables:** Proteus schematics (`lab1version2.pdsprj`, `New Project.pdsprj`), compiled HEX binaries, and technical documentation.

---

### Lab 2: Matrix Keypad Interfacing & Serial Communication (`microlab2/`)
* **Objective:** Non-blocking user input parsing, contact bounce mitigation, and hardware UART serial data transfer.
* **Hardware & Protocols:** $4\times 3$ / $4\times 4$ Matrix Keypad, Virtual Terminal, Oscilloscope, UART serial interface (`Serial`, `Serial1`–`Serial3`).
* **Firmware Logic:** Row-column matrix scanning (`Keypad.h`), switch debouncing algorithms, serial packet transmission, and oscilloscope verification of UART baud rates and start/stop bit timing.
* **Deliverables:** Schematic (`microlab2.pdsprj`), firmware (`microlab2 code.txt`), and lab report.

---

### Lab 3: Output Display & Hardware Calculator (`MicroLab3/`)
* **Objective:** Interfacing character LCD displays, bus mode comparisons, and building an interactive embedded calculator.
* **Hardware:** $16\times 2$ Alphanumeric Character LCD (HD44780 controller equivalent), $4\times 4$ Matrix Keypad, potentiometer contrast control ($V_O$).
* **Firmware Logic:** 
  * Implemented and compared both **4-bit** and **8-bit** parallel LCD bus modes with RS (Register Select), RW, and Enable strobe timing (`LiquidCrystal.h`).
  * Continuous marquee scrolling banner shifting text across line 1 and wrapping to line 2.
  * 4-digit PIN authentication security lock with `*` verification ("password correct" / "password wrong").
  * 4-function non-floating integer calculator parsing keypad expressions (e.g. `59+23=`) and formatting real-time output.
* **Deliverables:** Firmware source code, simulation hex files, and technical laboratory report.

---

### Lab 4: Precision Servomotor Actuation & Analog Input (`microlab4_9731131_mahdi afarideh/`)
* **Objective:** Servomotor angular position control ($0^\circ-180^\circ$) via Pulse Width Modulation (PWM) and analog-to-digital conversion (ADC).
* **Hardware:** TowerPro SG90 Servomotor, $10\,\text{k}\Omega$ linear potentiometer, matrix keypad, oscilloscope.
* **Firmware Logic:**
  * Configured $50\,\text{Hz}$ PWM control signals ($20\,\text{ms}$ frame period, $1.0-2.0\,\text{ms}$ pulse width for angular displacement).
  * Oscilloscope verification of fundamental period ($T$) and duty cycle across varied angular positions.
  * Closed-loop servo tracking dynamically mapped from analog potentiometer readings (`analogRead()`, `map()`).
  * Keypad-commanded angular indexing ($-90^\circ$ to $+90^\circ$).
* **Deliverables:** Proteus simulation (`microlab4.pdsprj`), firmware (`code.txt`), oscilloscope timing captures, and report.

---

### Lab 5: Transistorized Relay Switching & High-Current Loads (`microlab5_9731131_mahdi afarideh/`)
* **Objective:** Controlling high-voltage/high-current DC loads safely using electromechanical relays and transistor driver stages.
* **Hardware:** SPDT 5V Electromechanical Relay, NPN BJT Transistor (2N2222), flyback diode, DC motor, LED indicator, voltmeter, ammeter.
* **Circuit Design & Analysis:**
  * Analyzed ATmega2560 GPIO sink/source current limitations ($40\,\text{mA}$ absolute maximum) and calculated why relay coils require external transistor drivers.
  * Designed BJT common-emitter switch operating strictly in the **saturation region** ($I_B > I_{C(\text{sat})} / \beta$) to minimize collector-emitter drop ($V_{CE(\text{sat})} \approx 0.1-0.2\,\text{V}$).
  * Integrated a flyback freewheeling diode across the inductive relay coil to suppress high-voltage inductive kickback ($V = -L \frac{di}{dt}$).
* **Deliverables:** Schematics (`microlab5p0.pdsprj`, `oslab5p1.pdsprj`), firmware, and comprehensive design report.

---

### Lab 6: Midterm Capstone - Multi-Servo Automated Vending Machine (`microLab6/`)
* **Objective:** Systems integration combining multi-actuator control, user authentication, and inventory dispensing.
* **System Design (*"یعقوب برقی رایگان!"*):**
  * 12 independent servomotor-driven dispensing coils assigned to individual inventory shelves.
  * 7-digit administrative master passcode authentication via keypad for restocking mode.
  * Two-digit customer product selection with quantity tracking and confirmation on $16\times 2$ LCD.
  * Status indicator lighting and door-actuation mechanisms.
* **Deliverables:** Complete multi-hex build suite (individual servo calibration binaries), master firmware (`code.txt`), and lab report.

---

### Lab 7: Fault-Tolerant Washing Machine with TWI / I2C & EEPROM Persistence (`microlab7 9731131 mahdi afarideh/`)
* **Objective:** Master Two-Wire Interface (TWI / $\text{I}^2\text{C}$) communication, external EEPROM read/write cycles, and power-loss fault recovery.
* **Hardware & Protocols:** Atmel AT24C02 External EEPROM ($2\,\text{Kbit}$ serial memory), $16\times 2$ LCD, $4\times 4$ Keypad, status LEDs, TWI bus (SDA, SCL with pull-ups).
* **Firmware Architecture & Analysis:**
  * Implemented byte-write frames, random-address reads, dummy write address latching, and write-protection (WP) pin control via `Wire.h`.
  * Designed a 4-cycle state machine: Pre-Wash $\rightarrow$ Detergent Wash $\rightarrow$ Rinse $\rightarrow$ Spin Dry.
  * **Power-Outage Fault Tolerance:** Continuously checkpoints the active cycle mode and remaining time counter into non-volatile EEPROM. Upon power recovery, the microcontroller reads the persisted state and resumes the washing cycle seamlessly.
* **Deliverables:** Proteus project (`microlab7.pdsprj`), firmware (`code .txt`), bus timing captures, and laboratory report (`gozaresh (1).pdf`).

---

### Lab 8: Distributed Multi-Node Telemetry via SPI Bus (`microlab8 9731131 mahdi afarideh/`)
* **Objective:** Synchronous, full-duplex Master-to-Multi-Slave distributed communication over the Serial Peripheral Interface (SPI).
* **Hardware & Topology:** 3x Arduino Mega 2560 boards configured in a distributed bus topology:
  * **Master Node:** Central coordinator, clock master (SCLK), transmitting commands and polling sensors.
  * **Slave Node 1 (Light Telemetry):** Samples ambient room illuminance via LDR photoresistor voltage divider.
  * **Slave Node 2 (Temperature Telemetry):** Samples ambient temperature via calibrated LM35 analog temperature sensor ($10\,\text{mV}/^\circ\text{C}$).
* **Protocols & Analysis:**
  * Shared bus lines (MOSI, MISO, SCLK) with independent Slave Select lines (SS1, SS2, SS3).
  * Oscilloscope signal analysis verifying clock polarity/phase (CPOL/CPHA) and SPI transfer rates.
  * Interrupt-driven SPI reception on slave nodes (`ISR(SPI_STC_vect)`).
* **Deliverables:** Schematics (`microlab8.1.pdsprj`, `microlab8.2.pdsprj`), Master/Slave firmware variants, and lab report (`gozaresh.pdf`).

---

### Lab 9: Modular Audio Synthesis & Frequency Pitch Shifting (`microlab9_9731131_mahdi afarideh/`)
* **Objective:** Piezoelectric sound generation, audio frequency synthesis, and modular header file architecture in embedded C++.
* **Hardware:** Piezoelectric sounder transducer, $10\,\text{k}\Omega$ linear potentiometer (pitch control), pushbuttons.
* **Acoustic & Firmware Engineering:**
  * Modularized code architecture separating musical scale frequencies (`pitches.h`) and score arrangements (`themes.h`).
  * Structured timing and rhythm representation for whole notes, half notes, quarter notes, eighth notes, and dotted durations.
  * **Dynamic Pitch Transposition:** Utilized ADC readings from the potentiometer to dynamically transpose musical notes across higher and lower octaves in real time.
  * Synthesized multi-track scores:
    * Ludwig van Beethoven: *Ode to Joy* (from Symphony No. 9)
    * J. Pierpont: *Jingle Bells*
    * John Williams: *The Imperial March* (Star Wars Darth Vader's Theme)
* **Deliverables:** Proteus circuit (`oslab9.pdsprj`), header files (`pitches.h`, `themes.h`), audio firmware, and report (`gozaresh.pdf`).

---

## Technical Specifications & Tooling Summary

* **Microcontroller Target:** Atmel AVR ATmega2560 ($16\,\text{MHz}$, 54 Digital I/O, 16 Analog ADC, 4 UARTs, TWI, SPI).
* **Simulation Suite:** Labcenter Electronics Proteus VSM (Virtual System Modelling) v8.x.
* **Firmware Languages:** C/C++ (Arduino framework & direct register manipulation), modular header architecture.
* **Communication Protocols:** TWI / $\text{I}^2\text{C}$ (Standard $100\,\text{kHz}$), SPI (Full-duplex Master/Multi-Slave), Hardware UART.
* **Actuators & Sensors:** SG90 Servomotors, SPDT Relays, LM35 Temperature Sensor, LDR Photocell, Piezo Sounders, Matrix Keypads, $16\times 2$ Character LCDs.
