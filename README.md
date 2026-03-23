# 5-Stage Pipelined RISC-V CPU (RV32I)

This project implements a 32-bit pipelined RISC-V processor written in Verilog.

The design targets the RV32I instruction set and demonstrates the core concepts of modern processor architecture including pipelining, hazard detection, and data forwarding. The project is developed and verified entirely through simulation.

This repository is intended as a learning project and portfolio demonstration for digital design, FPGA, and ASIC roles.

---

# Features

- RV32I base instruction set
- 32-bit datapath
- 5-stage pipeline:
  - Instruction Fetch (IF)
  - Instruction Decode (ID)
  - Execute (EX)
  - Memory Access (MEM)
  - Writeback (WB)
- Hazard detection unit
- Data forwarding
- Register file with 32 registers
- Arithmetic Logic Unit (ALU)
- Verilog RTL implementation
- Simulation and waveform debugging

---

# CPU Architecture

The processor follows a standard 5-stage pipeline architecture.

IF → ID → EX → MEM → WB

Pipeline stages:

| Stage | Description |
|------|-------------|
| IF | Fetch instruction from instruction memory |
| ID | Decode instruction and read register operands |
| EX | Execute ALU operations |
| MEM | Access data memory for load/store instructions |
| WB | Write results back to the register file |

Architecture diagrams will be added in the docs folder.

---

## 📁 Project Structure

```text
riscv-pipelined-cpu/
├── rtl/
│   ├── alu.v
│   ├── register_file.v
│   ├── control_unit.v
│   ├── pc.v
│   └── cpu.v
│
├── sim/
│   ├── cpu_tb.v
│   └── test_program.hex
│
├── docs/
│   ├── architecture.png
│   ├── pipeline.png
│   └── waveform.png
│
├── scripts/
│
└── README.md
```
Folder description:

| Folder | Purpose |
|------|---------|
| rtl | Verilog RTL modules implementing the CPU |
| sim | Testbenches and simulation programs |
| docs | Architecture diagrams and waveform screenshots |
| scripts | Helper scripts for running simulations |

---

# Simulation

The design is simulated using Icarus Verilog and GTKWave.

Compile:

iverilog -g2012 -o cpu_test sim/cpu_tb.v rtl/*.v

Run simulation:

vvp cpu_test

View waveforms:

gtkwave waveform.vcd

---

# Tools

The project uses open-source tools compatible with macOS and Linux.

- Verilog HDL
- Icarus Verilog
- GTKWave
- Git / GitHub
- VS Code

---

# Future Improvements

Planned extensions include:

- Branch prediction
- Cache implementation
- Additional RISC-V instructions
- FPGA deployment
- Performance optimizations

---

# Learning Goals

This project demonstrates key concepts in digital hardware design:

- RTL design in Verilog
- CPU datapath architecture
- pipeline control logic
- hazard detection and forwarding
- hardware verification through simulation

---

# License

MIT License
