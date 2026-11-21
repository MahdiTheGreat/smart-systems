# Low-Level Assembly Code Algorithms

A curated suite of assembly language programs and mathematical algorithms developed for ARM architecture, validated and tested using the **Keil $\mu$Vision IDE** and the **VisUAL ARM Emulator**.

## Implemented Routines

| File / Program | Algorithm / Operation | Description |
|---|---|---|
| `absoluteCalculator` | **Two's Complement Absolute Value** | Sign-bit inspection via condition flags (`adds`, `bpl`) and two's complement inversion (`eor`, `add`). |
| `convertedCodeSnippet` | **Memory Pointer Traversal** | Translation of high-level C pointer arithmetic (`*ptr`, `sum += *ptr`) into low-level assembly registers. |
| `convertedCodeSnippet v2` | **Indexed Array Summation** | Iterative traversal and accumulation of 20-element 32-bit integer arrays via offset register indexing (`ldr r5, [r0]`). |
| `for (i=0; i15; i++) j=j+j` | **Looping & Addition with Carry** | Iterative 32-bit accumulator with carry flag propagation (`adc`) and decrementing loop branches (`subs`, `bne`). |
| `how many numbers devisible by 3 in (0,r0)` | **Divisibility & Modulo Filter** | Count-check algorithm determining multiples of 3 within a dynamic upper bound $[0, R_0]$ without hardware division instructions. |
| `r0 devided by r1=r2 and r0%r1=r2` | **Integer Division & Modulo** | Multi-register division restoring algorithm via iterative subtraction, computing quotient and remainder in parallel. |
| `r0=2^r1` | **Power-of-Two Exponentiation** | Calculates $2^{R_1}$ using iterative bit shifting and conditional accumulation loops. |
| `r1 x r0` | **Multiplication Algorithm** | Software-implemented unsigned integer multiplication via repeated addition with 64-bit overflow handling. |
| `r1^r0` | **General Power Calculation** | Computes arbitrary base-exponent powers ($R_1^{R_0}$) using nested multiplication loops. |

## Technical Competencies
* **Architectures:** ARM Cortex-M / ARMv7 ISA.
* **Control Flow:** Conditional branching (`BNE`, `BPL`, `CMP`), condition flag handling (`N`, `Z`, `C`, `V`).
* **Memory Management:** Register-indirect addressing, post/pre-indexed base pointer manipulation (`LDR`, `STR`).
* **Toolchains:** Keil $\mu$Vision, VisUAL Simulator.
