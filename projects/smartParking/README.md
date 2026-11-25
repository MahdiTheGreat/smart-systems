# Multi-Bay Smart Parking Management System

An automated multi-level parking facility management controller implemented on the **Atmel AVR (ATmega2560)** architecture, coordinating ultrasonic and infrared occupancy detection, automated servo gate barriers, real-time LCD capacity telemetry, and duration-based tariff computation.

---

## System Architecture & Features

* **Multi-Level Occupancy Monitoring:**
  * Monitors 3 distinct parking levels (Levels A, B, C) with 3 dedicated bays per floor (9 total parking bays).
  * Passive Infrared (PIR) and optical sensors per bay provide real-time occupancy status inputs (`testPin = 0/1`).
  * Dedicated dual-state LED indicators per bay signal vacant (Green) vs. occupied (Red) status.
* **Telemetry & Display Interface:**
  * Interfaced with a 4-line alphanumeric display (`LM041L`), presenting per-floor vacancy counts (Levels A, B, C) and aggregate facility capacity in real time.
* **Access Control & Fee Processing:**
  * **Entry Protocol:** Authenticates driver ID and PIN via a matrix keypad; verifies system capacity across all levels and triggers servo motor gate actuation upon confirmed vacancy.
  * **Exit Protocol & Tariff Billing:** Prompts driver credentials at exit, tracks total parking duration, computes dynamic billing tariffs based on elapsed hours, and triggers the exit servo barrier upon payment acknowledgment.
* **Simulation & Hardware Verification:** Validated via interactive circuit simulation in **Proteus VSM** with complete AVR firmware logic.
