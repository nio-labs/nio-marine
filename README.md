# 🌊 Nio Marine — The Sovereign Companion Fleet

[![License: BSL 1.1](https://img.shields.io/badge/License-BSL%201.1-blue.svg)](LICENSE)
[![Engine: nio-xs](https://img.shields.io/badge/Engine-nio--xs-orange.svg)](https://github.com/nio-labs/nio-xs)
[![RAM Footprint: Sub-400MB](https://img.shields.io/badge/Peak%20RAM-%3C%20400%20MB-emerald.svg)](#the-engineering-breakthrough-little-to-no-peak-ram)
[![Zero Cloud Dependency](https://img.shields.io/badge/Privacy-100%25%20Offline-purple.svg)](#sovereign--private)

> **Formerly Known as the Predator Tier:** Evolved from early experimental predator prototypes into **Nio Marine**, Nio's dedicated conversational pair-programming and companion intelligence fleet.

---

## 🎯 What is Nio Marine?

While the **Land Fleet** (`nio-land`) handles pure, zero-filler systems programming and the **Avian Fleet** (`nio-avian`) handles visual screenshot debugging, **Nio Marine** is your **sovereign pair-programming thought partner**.

Nio Marine models are trained for:
- 🤝 **Interactive Pair Programming:** Collaborative architectural reasoning, code reviews, and API trade-off discussions.
- 🧠 **Structured Reasoning (`<think>` blocks):** Step-by-step problem decomposition before code emission.
- 💬 **Developer Empathy & Context:** Explaining complex systems, onboarding developers to unfamiliar codebases, and diagnosing tricky runtime bugs.
- ⚡ **Zero Cloud Latency:** 100% sovereign inference on your local CPU. Your proprietary code never leaves your workstation.

---

## ⚡ The Engineering Breakthrough: How We Consume Little to No Peak RAM

The number one obstacle with existing local AI models (such as 8B–32B models run via standard Ollama or llama.cpp) is the **Memory Wall**:
- Standard 8B models consume **6 GB to 9 GB of RAM**.
- Standard 32B models consume **18 GB to 24 GB of RAM**, freezing 8GB and 16GB laptops via intense OS swap thrashing.
- Running your browser, Slack, Docker, and an IDE alongside a typical local model quickly triggers Out-Of-Memory (OOM) crashes.

### How Nio Marine Models Run in Under 400 MB Resident RAM

Nio Marine models solve this through a combination of proprietary compiler techniques and OS-level memory streaming:

```
Traditional Local Model (Ollama / Llama.cpp):
[ Model Weights Copied to Heap ] + [ Static 4GB KV Cache ] + [ FP32 Buffers ]
└──> Spikes to 6,000 MB – 18,000 MB RAM (System Thrashes)

Nio Marine (v-µLM Layer Streaming + nio-xs):
[ mmap Zero-Copy File View ] ──> Dynamic Layer Sliding Window
└──> Peak Resident RAM: 391 MB RSS (Runs alongside Chrome & IDE seamlessly)
```

1. **`v-µLM` Dynamic Layer Sliding Window:**
   Instead of pinning all transformer layers permanently into physical RAM, the `nio-xs` engine streams weight slices directly from NVMe through an active sliding window (`madvise(MADV_WILLNEED)`). The kernel transparently handles working-set paging without application-level memory duplication.
2. **Zero-Copy Memory Mapping (`MAP_SHARED`):**
   Model weights are never duplicated into application-heap (`malloc`) memory. Physical RSS (Resident Set Size) reflects only the active compute layers.
3. **Paged Chunked KV Cache:**
   Rather than pre-allocating gigabytes of RAM for theoretical 32k context windows, memory is dynamically allocated in 64-token chunks. A 2,000-token pair-programming prompt consumes mere tens of megabytes.
4. **Direct SIMD Integer Quantization:**
   Computations run directly on quantized weights via CPU AVX2 / AVX-512 / ARM NEON registers without intermediate dequantization buffers.

### Production Benchmark Verification

#### 1. Pure CPU Baseline (Intel Core Ultra 5 135H, Linux / WSL2)

| Metric | Traditional 7B/8B (Ollama) | Nio Marine Flagship (`Blue`) |
| :--- | :--- | :--- |
| **Physical RAM (RSS)** | `6,400 MB` | **`391 MB`** |
| **Anonymous Memory (`RSS_ANON`)** | `5,800 MB` | **`172 MB`** |
| **Disk Binary Size** | `4.7 GB` | **`1.4 GB`** |
| **Usable on 8GB MacBook Air?** | ❌ System Lag | **✅ Silky Smooth** |
| **Usable Alongside Docker/Chrome?** | ❌ High OOM Risk | **✅ Leaves 90%+ RAM Free** |

#### 2. Native GPU Acceleration Benchmarks (MacBook Air M1, 8GB RAM, macOS Metal)

Executed directly via `nioxs` sovereign companion runtime with 100% Metal GPU offloading:

| Model | Parameters | Disk Size | Metal Offload | Avg First Latency | Avg Words | Streaming Throughput |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| ⚡ **Skate** | 135M | `82 MB` | **30/30 layers (100% GPU)** | **1.77 s** | 27 words | **14.55 words/s** |
| 🦈 **Manta** | 494M | `318 MB` | **24/24 layers (100% GPU)** | **3.07 s** | 65 words | **21.18 words/s** |
| 🌊 **Beluga** | 1.54B | `610 MB` | **28/28 layers (100% GPU)** | **5.35 s** | 29 words | **5.42 words/s** |
| 🐋 **Blue** | 1.4B | `1.4 GB` | CPU / Hybrid (8GB unified memory SLA) | 11.20 s | 32 words | 2.20 words/s |

---

## 🌊 The Marine Fleet Lineup

| Model | Size | Active RAM | Specialization |
| :--- | :--- | :--- | :--- |
| 🐋 **Blue** | 1.4B | **< 400 MB** | **Flagship Pair Programmer:** Deep multi-turn dialogue, architectural reasoning, and code review. |
| 🌊 **Beluga** | 3.0B | **< 950 MB** | **Context & Docs Maven:** Long-context synthesis, documentation Q&A, and repository search. |
| 🦈 **Manta** | 494M | **< 180 MB** | **Workflow & Guru:** Compiler diagnostics explanation, AST repair, and structured refactoring. |
| ⚡ **Skate** | 135M | **< 80 MB** | **Prompt Reflex:** Interactive intention triage, sub-second query clarification, and shell prompt help. |

---

## 🚀 Quickstart & Installation

### 1. Install the Sovereign Engine (`nioxs`)
Install the high-performance native runtime via the universal installer (Linux, macOS, WSL):

```bash
curl -fsSL https://raw.githubusercontent.com/nio-labs/nio-xs/main/install.sh | bash
```

For native Windows (PowerShell):
```powershell
irm https://raw.githubusercontent.com/nio-labs/nio-xs/main/install.ps1 | iex
```

### 2. Direct CLI Invocation
Interact with any Marine companion directly via `nioxs`:

```bash
# Chat with Blue (Flagship Companion)
nioxs blue

# Single-shot architectural inquiry with chain-of-thought reasoning
nioxs blue "Compare Raft vs Multi-Paxos under high network jitter."

# Beluga (Lead Architect & Documentation Memory)
nioxs beluga "Explain epoll vs io_uring architecture under high concurrency"

# Manta (Systems Guru & DAG Workflow Generation)
nioxs manta "Architect a zero-downtime PostgreSQL schema migration"

# Skate (Ambient Desk Companion & Triage)
nioxs skate "Plan out our focus sprint for the morning"
```

### 3. Terminal Interactive Pair-Programming
```bash
$ nioxs blue
🌊 Nio Marine v0.3 (Blue-1.4B / Peak RAM: 391MB)
> How should we organize our multi-threaded event loop in Rust?
<think>
1. Event loop requirements: non-blocking I/O, thread safety, low lock contention.
2. Architecture choice: Tokio with mpsc channels or crossbeam-channel.
3. Memory safety: avoid Arc<Mutex<T>> hot-spots; prefer message passing.
</think>
To achieve maximum throughput with minimal lock contention, adopt an actor-like
message-passing architecture using tokio::sync::mpsc rather than shared mutable state...
```

---

## 📊 Comparison Matrix

| Feature | GitHub Copilot / Cloud AI | Traditional Local (Ollama 8B) | Nio Marine (`Blue`) |
| :--- | :--- | :--- | :--- |
| **Privacy / Sovereignty** | ❌ Code sent to cloud | ✅ Local | **✅ 100% Local & Sovereign** |
| **RAM Footprint** | N/A (Cloud) | ❌ 6,000 MB – 8,000 MB | **✅ 391 MB (Sub-400MB)** |
| **Subscription Cost** | $10 – $39 / mo | Free (Needs $1,500+ PC) | **$0 / Free Local Use** |
| **Runs on 8GB RAM Laptop?** | Yes (via Cloud) | ❌ Triggers swap thrash | **✅ Yes (Pure CPU)** |
| **Offline Operation** | ❌ Requires WiFi | ✅ Yes | **✅ Complete Air-Gap Support** |
| **Structured Reasoning** | Hidden | Varies | **✅ Explicit `<think>` Blocks** |

---

## 📜 Licensing: Business Source License 1.1 (BSL 1.1)

`nio-marine` is licensed under the **Business Source License 1.1 (BSL 1.1)**.

- **Free for Developers & Internal Business:** You can freely copy, modify, evaluate, test, and use Nio Marine models for personal development, research, and internal production tools inside your organization.
- **Protection Against Cloud Re-Sellers:** Cloud service providers and AI hosting companies are strictly prohibited from offering Nio Marine models as a paid hosted or managed API service in competition with Nio Labs without a commercial license.
- **Sunset Clause to Open Source:** On **October 20, 2030** (four years from initial release), this license automatically converts to the fully open **Apache License, Version 2.0**.

For custom enterprise deployment licenses, contact: `dev@n-o.me`.

---

<p align="center">
  <b>Built with sovereign pride by <a href="https://github.com/nio-labs">Nio Labs</a></b><br>
  <i>Empowering developers with intelligence that respects their memory, privacy, and sovereignty.</i>
</p>
