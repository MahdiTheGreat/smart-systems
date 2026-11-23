# M. Morris Mano Computer Architecture & VHDL / Python Implementation

A dual-paradigm implementation of the classic M. Morris Mano 16-bit Basic Computer architecture, featuring a complete Register Transfer Level (RTL) design in **VHDL** and a behavioral cycle-accurate software simulator in **Python**.

## System & Instruction Set Architecture

* **Word Size & Memory:** 16-bit word size, $4096 \times 16$ direct/indirect addressable RAM memory space (`ram.vhd`).
* **Registers:**
  * **AR (Address Register):** 12 bits (`reg16.vhd`).
  * **PC (Program Counter):** 12 bits with incremental sequence control.
  * **DR (Data Register):** 16 bits holding memory operands.
  * **AC (Accumulator):** 16-bit primary arithmetic and logic working register.
  * **IR (Instruction Register):** 16 bits latching operation codes and addressing modes.
  * **TR (Temporary Register):** 16 bits for scratchpad data transfer.
* **Common Bus Architecture (`BUS.vhd`):**
  * Multiplexer-based common bus interconnect routing 16-bit register words across memory and execution units with high impedance tri-state controls.
* **Execution & Timing Control:**
  * 4-bit Sequence Counter (`Counter4bit.vhd`) driven by a $3\times 8$ decoder (`DEC38.vhd`) and $4\times 16$ decoder (`DEC416.vhd`) generating micro-operation timing signals ($T_0-T_{15}$).
  * Arithmetic Logic Unit (`ALU.vhd`): Executes micro-operations including addition, bitwise logic (AND, XOR, NOT), and complementation with carry flag preservation.
* **Instruction Set Supported:**
  * **Memory-Reference:** `AND`, `ADD`, `LDA` (Load AC), `STA` (Store AC), `BUN` (Branch Unconditional), `BSA` (Branch and Save Return Address), `ISZ` (Increment and Skip if Zero).
  * **Register-Reference & I/O:** Clear, complement, circular shifts, and skip conditions.

## Verification & Simulation
* **VHDL RTL Testbench:** Comprehensive simulation testbenches (`basicComputerTestBench2.vhd`, `CounterTestBench.vhd`) validating timing cycles, bus routing, and register transfers.
* **Python Emulator (`BasicComputer.py`):** Cycle-accurate software simulator modeling instruction fetch, decode, indirect effective address computation, and execution cycles.
