# Simplrisc 5-Stage Pipeline Processor

A Verilog implementation of a 5-stage pipelined RISC-V processor core with hazard detection and forwarding logic.

## Features

- **5-Stage Pipeline Architecture**
  - Fetch (IF)
  - Decode (ID)
  - Execute (EX)
  - Memory (MEM)
  - Writeback (WB)
- Data Hazard Handling with Forwarding Unit
- Basic simplerisc Instruction Support
  ### Pipeline Stages

1. **Fetch Stage**
   - PC Management
   - Instruction Memory Interface

2. **Decode Stage**
   - Register File (32 registers)
   - Immediate Generation
   - Control Signal Decoding

3. **Execute Stage**
   - ALU Operations
   - Branch Resolution
   - Forwarding Logic

4. **Memory Stage**
   - Data Memory Access
   - Load/Store Operations

5. **Writeback Stage**
   - Result Selection (ALU/Memory/PC+4)
   - Register Update
   - 
### Hazard Handling

- **Forwarding Unit** detects RAW hazards from:
  - MEM stage results
  - WB stage results

