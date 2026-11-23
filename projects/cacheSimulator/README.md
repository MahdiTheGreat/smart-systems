# CPU Cache Hierarchy Simulator

A parameterizable CPU cache memory simulator modeling multi-level memory hierarchies, cache organization architectures, replacement policies, and write strategies.

## Architectural Capabilities

* **Cache Organizations:**
  * **Unified Cache:** Single unified cache memory for instructions and data (Von Neumann architecture).
  * **Split Caches:** Separate, concurrently accessed Instruction and Data caches (Harvard architecture).
* **Associativity Configurations:**
  * Direct-Mapped Caches ($1$-way associativity per set).
  * $N$-Way Set-Associative Caches (flexible set count and line count per set).
  * Fully Associative Caches ($1$ set containing all cache lines).
* **Eviction & Replacement Policy:**
  * Least Recently Used (LRU) replacement policy implemented via dynamic doubly-linked list tracking for constant-time $O(1)$ set management and tail eviction.
* **Write & Allocation Policies:**
  * **Write-Back (WB):** Updates cache lines with dirty-bit tracking, writing back to main memory only upon block eviction.
  * **Write-Through (WT):** Synchronously propagates all write operations immediately to main memory.
  * **Write-Allocate (WA) vs. No-Write-Allocate (NWA):** Allocates a cache block on a write miss or passes the write directly to lower memory.

## Performance Metrics & Telemetry
* Hit and miss counts / rates across instruction and data requests.
* Total memory traffic (demand fetch words transferred and dirty copy-back words).
* Multi-trace benchmarking against standard benchmark memory address streams.
