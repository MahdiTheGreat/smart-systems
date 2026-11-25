# Automated Classroom Attendance Terminal

An embedded authentication and check-in terminal designed on the **Atmel AVR (ATmega2560)** architecture, integrating matrix keypad authentication, LCD status telemetry, servo gate actuation, and strict time-window arrival tracking.

---

## System Architecture

* **Matrix Keypad Interface:** Captures user numeric student identification numbers with real-time software debouncing and character buffer latching.
* **Alphanumeric LCD Telemetry:** Displays ID input confirmation, real-time elapsed session time, and access grant/deny status messages.
* **Access Control Actuation:**
  * **On-Time Check-In ($\le 10$ minutes):** Validates ID within the permissible arrival window, illuminates an active green indicator LED for 3 seconds, and actuates a servo motor barrier to grant physical entry.
  * **Tardy / Invalid Attempt ($> 10$ minutes):** Triggers a 1-second audible warning buzzer alert, holds the servo barrier closed, and updates LCD telemetry with the exact late duration.
* **Session Roster Persistence:** Compiles internal session rosters recording verified attendees and flagging absent records at the conclusion of the check-in period.
* **Circuit Verification:** Modeled and simulated interactively in **Proteus VSM** with complete register-level AVR C/C++ firmware.
