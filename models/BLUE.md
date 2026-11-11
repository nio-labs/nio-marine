# 🐋 Model Card: Blue (1.4B v-µLM Companion)

## Overview
**Blue** is the flagship conversational pair-programming companion of the Nio Marine fleet. Derived and distilled from frontier reasoning models, Blue combines structured `<think>` reasoning with developer empathy, providing high-clarity architectural guidance while operating within a strict **< 400 MB resident RAM** footprint on CPU.

## Key Specifications
- **Architecture:** `v-µLM` (Virtual MicroLM) Dynamic Layer Streaming
- **Parameters:** 1.4 Billion
- **Quantization:** Q4_K_M
- **Disk Footprint:** ~1.4 GB
- **Peak Physical RAM (RSS):** **391.98 MB**
- **Anonymous Heap RAM (RSS_ANON):** **172.80 MB**
- **Context Length:** 8,192 tokens (Paged Chunked Attention)
- **Target Platform:** Pure CPU (x86_64 / ARM64), $400 Laptops, 8GB MacBook Airs, Raspberry Pi 5.

## Performance Benchmarks
*Tested on Intel Core Ultra 5 135H (Pure CPU, Linux WSL2):*
- **Time-to-First-Token (TTFT):** ~1.05s
- **Generation Speed:** 3.86 tokens/sec (~2.88 words/sec)
- **Memory Overhead:** Runs comfortably alongside IDEs, Slack, and Docker without causing OS swap pressure.

## Usage
```bash
nioxs blue
```
