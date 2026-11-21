# Smart Screen - Adaptive Backlight Controller

An embedded ambient light-sensing controller designed to automatically regulate display backlight brightness in real time according to surrounding illumination, minimizing battery consumption and user eye strain.

## System Architecture

* **Ambient Light Sensor:** Light Dependent Resistor (LDR) integrated in a calibrated voltage divider circuit feeding into an analog input pin (ADC).
* **Display Backlight:** High-efficiency LED array driven via Pulse Width Modulation (PWM) from an 8-bit timer/counter.
* **Control Algorithm:** Inverse mapping function translating ambient lux into complementary PWM duty cycles ($0-255$), automatically brightening the display under direct daylight and dimming it in low-light environments.
* **Simulation & Hardware:** Modeled and tested in **Proteus VSM** (`smartScreen.pdsprj`) on the **ATmega328P** (Arduino platform).

## Key Files
* `smartScreen.ino`: Microcontroller firmware source code.
* `smartScreen.pdsprj`: Proteus schematic and interactive circuit simulation.
* `smartScreen.ino.with_bootloader.hex`: Compiled production binary for direct flashing.
