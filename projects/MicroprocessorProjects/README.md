# Microprocessor & Embedded Systems Firmware Suite

A collection of 9 modular embedded firmware systems and circuit designs implemented in C/C++ on the **ATmega2560 (Arduino Mega 2560)** architecture, modeled and verified via **Proteus VSM** interactive circuit simulation.

---

## Systems & Firmware Architecture

### 1. Multi-Directional GPIO State Controller (`microProcessorLab1/`)
* **System Function:** Manages bi-directional sequential illumination across an 8-LED output array driven by an asynchronous 3-button digital state machine.
* **Firmware Implementation:**
  * Left-to-Right Scan: Progressively indexes and latches active LED output pins with millisecond debounce filtering.
  * Right-to-Left Scan: Reverse-direction shifting algorithm.
  * Synchronous Clear: Resets the entire port output register to zero.
* **Circuit Design:** Interfaced with $220\,\Omega$ current-limiting series resistors and $10\,\text{k}\Omega$ pull-down networks in Proteus.

---

### 2. Matrix Keypad Scanning & UART Serial Telemetry (`microlab2/`)
* **System Function:** Non-blocking matrix keypad input decoding paired with full-duplex hardware UART serial communication.
* **Firmware Implementation:**
  * Implemented row-column scanning across $4\times 3$ and $4\times 4$ key matrices using timed pin toggling.
  * Integrated software debouncing to suppress mechanical switch contact bounce.
  * Transmits and receives formatted ASCII data packets over hardware serial ports (`Serial`, `Serial1`–`Serial3`).
* **Instrumentation:** Validated serial frame timing, start/stop bit transitions, and baud rates using the Proteus Virtual Terminal and Oscilloscope.

---

### 3. Alphanumeric LCD Bus Driver & Embedded Calculator (`MicroLab3/`)
* **System Function:** High-speed alphanumeric text rendering and an embedded four-function integer arithmetic calculation engine.
* **Firmware Implementation:**
  * Parallel bus interfacing for standard HD44780-compatible $16\times 2$ character LCDs, evaluating both **4-bit nibble mode** and **8-bit parallel mode** with Register Select (RS), Read/Write (RW), and Enable strobe timing.
  * Continuous horizontal marquee scroll engine shifting character buffers across line 1 and wrapping around to line 2.
  * Security Access Controller: Verifies a 4-digit PIN against internal memory with masked LCD feedback and status banners.
  * Hardware Calculator: Real-time keypad character stream tokenizer supporting addition, subtraction, multiplication, and integer division.

---

### 4. Precision PWM Servomotor Actuator & ADC Tracking (`microlab4_9731131_mahdi afarideh/`)
* **System Function:** Angular position control ($0^\circ-180^\circ$) of servomotors using timer-driven Pulse Width Modulation (PWM) and closed-loop analog feedback.
* **Firmware Implementation:**
  * Generated precise $50\,\text{Hz}$ PWM signals ($20\,\text{ms}$ period with $1.0\,\text{ms}-2.0\,\text{ms}$ active duty cycle pulses) mapped to angular position.
  * Integrated an analog potentiometer voltage divider via on-chip 10-bit Analog-to-Digital Converter (ADC) for continuous closed-loop position tracking.
  * Configured serial command interface and matrix keypad input to command discrete angular setpoints ($-90^\circ$ to $+90^\circ$).

---

### 5. Transistorized Relay Switching & Inductive Load Driver (`microlab5_9731131_mahdi afarideh/`)
* **System Function:** High-current/high-voltage DC actuator switching circuit designed to isolate microcontroller logic from noisy inductive loads.
* **Circuit Design & Electrical Analysis:**
  * Solved the GPIO pin drive limitation ($40\,\text{mA}$ absolute maximum) by designing a discrete NPN BJT driver (2N2222) operating strictly in the **saturation region** ($I_B > I_{C(\text{sat})}/\beta$) to minimize conduction losses ($V_{CE(\text{sat})} \approx 0.1-0.2\,\text{V}$).
  * Added a parallel flyback (freewheeling) diode across the relay coil to safely clamp inductive back-EMF transients ($V = -L \frac{di}{dt}$) during de-energization.
  * Controlled high-current DC motors and dual-state status indicators via an SPDT electromechanical relay.

---

### 6. Multi-Channel 12-Servo Automated Vending Dispenser (`microLab6/`)
* **System Function:** Multi-tier inventory dispensing controller coordinating 12 independent servomotor-driven release mechanisms.
* **Firmware Implementation:**
  * 12-channel PWM servo control assigning dedicated angular rotational routines to each inventory slot.
  * Two-digit customer product code selection and item count tracking displayed via $16\times 2$ LCD.
  * 7-digit administrative master passcode authentication mode to initiate inventory restocking cycles.

---

### 7. Fault-Tolerant Controller with TWI / I2C External EEPROM State Persistence (`microlab7 9731131 mahdi afarideh/`)
* **System Function:** 4-stage automated cycle controller featuring non-volatile state checkpointing to achieve complete power-loss fault tolerance.
* **Firmware Implementation:**
  * Communicates with an external **Atmel AT24C02 serial EEPROM ($2\,\text{Kbit}$)** over the Two-Wire Interface (TWI / $\text{I}^2\text{C}$), implementing byte writes, random-address reads, and dummy write address latching.
  * Executes a 4-mode sequential state machine: Pre-Wash $\rightarrow$ Detergent Wash $\rightarrow$ Rinse $\rightarrow$ Spin Dry.
  * **Power-Outage Recovery:** Continuously persists active cycle flags and remaining countdown timers to non-volatile EEPROM. Upon system boot/reset, firmware reads saved registers and resumes operation from the exact interrupted state.

---

### 8. Distributed Multi-Node Sensor Network via Synchronous SPI Bus (`microlab8 9731131 mahdi afarideh/`)
* **System Function:** Full-duplex distributed telemetry network connecting a central Master MCU to multiple dedicated Slave sensor nodes over the SPI bus.
* **System Topology & Protocols:**
  * **Master Controller:** Central bus arbiter generating serial clock (SCLK) and toggling dedicated Slave Select (SS1, SS2, SS3) lines.
  * **Slave Node 1 (Photometric Sensing):** Reads ambient illumination through a calibrated LDR photoresistor circuit and packages sensor telemetry.
  * **Slave Node 2 (Thermal Sensing):** Samples room temperature via an analog LM35 precision temperature sensor ($10\,\text{mV}/^\circ\text{C}$).
  * **Interrupt-Driven Reception:** Slave microcontrollers utilize interrupt service routines (`ISR(SPI_STC_vect)`) to capture and parse incoming packets without polling overhead.

---

### 9. Modular Audio Frequency Synthesizer & Dynamic Pitch Transposition (`microlab9_9731131_mahdi afarideh/`)
* **System Function:** Microcontroller-based musical tone synthesizer generating calibrated audio waveforms through a piezoelectric sounder.
* **Firmware Architecture:**
  * Modular C++ header structure separating musical note frequency definitions (`pitches.h`) from score melodies and tempo durations (`themes.h`).
  * Implemented fractional duration calculations for whole, half, quarter, eighth, and dotted note values.
  * **Dynamic Pitch Transposition:** Reads real-time analog input from a linear potentiometer to dynamically modulate baseline frequency tables up or down across octaves during playback.
  * Synthesized multi-track arrangements: Beethoven's *Ode to Joy*, *Jingle Bells*, and John Williams' *The Imperial March*.

---

## Technical Specifications & Tooling Summary

* **Target Microcontroller:** Atmel AVR ATmega2560 ($16\,\text{MHz}$, 54 Digital I/O, 16 Analog Inputs, 4 Hardware UARTs, TWI, SPI).
* **Simulation Software:** Labcenter Electronics Proteus VSM (Virtual System Modelling).
* **Firmware Languages:** C/C++ (Direct register manipulation and standard Arduino runtime).
* **Communication Protocols:** TWI / $\text{I}^2\text{C}$ ($100\,\text{kHz}$), SPI (Full-duplex Master/Multi-Slave), Hardware UART.
* **Hardware Interfaced:** SG90 Servomotors, SPDT Relays, AT24C02 EEPROM, LM35 Temperature Sensor, LDR Photocells, Piezo Sounders, Matrix Keypads, HD44780 LCDs.
