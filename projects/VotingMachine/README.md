# Heterogeneous Multi-Protocol Electronic Voting System

A distributed electronic voting architecture designed for secure, multi-terminal election environments, integrating diverse communication protocols and non-volatile result persistence.

## System Architecture

* **Multi-Node Bus Topology:**
  * **Master Central Unit:** Central polling coordinator and election aggregator.
  * **Remote Voting Terminals:** Distributed voter interface stations capturing authenticated input and transmitting vote packets.
* **Heterogeneous Communication Interfaces:**
  * **Serial Peripheral Interface (SPI):** High-speed synchronous voting data transfer between master and co-located peripheral controllers.
  * **Two-Wire Interface (TWI / $\text{I}^2\text{C}$):** Multi-drop bus addressing distributed terminal nodes and persistent memory modules.
  * **Universal Asynchronous Receiver-Transmitter (UART):** Point-to-point asynchronous terminal communications with hardware flow control.
* **Reliability & Tamper-Resistance:**
  * Non-volatile EEPROM storage preserving candidate tallies and vote counts against system restarts and power interruptions.
  * Verified across multiple operational topologies in **Proteus VSM** simulation environments (`microlab final v8 serial and spi and i2c scneario2.pdsprj`, `scenario3`, etc.).
