# Snapdragon 8 Elite vs. Apple A18 Pro: Local LLM & GGUF Benchmarks

[![Hardware Lab](https://img.shields.io/badge/TechLoverHD-Hardware%20Lab-orange.svg)](https://techloverhd.com)
[![Tested On](https://img.shields.io/badge/Silicon-Qualcomm%20Oryon%20vs%20Apple%20A18%20Pro-blue.svg)](https://techloverhd.com/2026/11/snapdragon-8-elite-a18-pro-llm/)
[![License: MIT](https://img.shields.io/badge/License-MIT-emerald.svg)](../../../LICENSE)

Companion benchmark dataset and execution methodology for the TechLoverHD hardware deep dive:
**[Snapdragon 8 Elite vs. Apple A18 Pro: Local LLM & GGUF Benchmarks](https://techloverhd.com/2026/11/snapdragon-8-elite-a18-pro-llm/)**

---

## 1. Hardware Test Rig Specifications

| Parameter | Qualcomm Snapdragon 8 Elite | Apple A18 Pro |
| :--- | :--- | :--- |
| **Test Device** | Samsung Galaxy S25 Ultra | Apple iPhone 16 Pro Max |
| **Operating System** | Android 17 (Samsung One UI 9.0) | iOS 18.2 |
| **CPU Architecture** | 2x 4.32 GHz Oryon Prime + 6x 3.53 GHz Oryon Performance | 2x 4.05 GHz Performance + 4x 2.42 GHz Efficiency |
| **LPDDR Memory** | 12GB LPDDR5X-10600 (64-bit dual-channel) | 8GB LPDDR5X-7500 (64-bit) |
| **Theoretical Bandwidth** | 84.8 GB/s | 68.2 GB/s |
| **Measured DRAM Bandwidth** | **84.8 GB/s** | **60.0 GB/s** |
| **Single-Process RAM Ceiling** | **~7.8 GB** (LMK free headroom) | **~5.2 GB** (Apple Jetsam `EXC_RESOURCE`) |
| **Inference Client** | PocketPal AI v0.10.4 (llama.cpp b4890) | PocketPal AI v0.10.4 (llama.cpp b4890) |
| **Execution Backend** | ARM KleidiAI + Vulkan Compute | Apple Metal 3 GPU + AMX |

---

## 2. Benchmark Summary (Decode Tokens/Second)

All models tested at 2048 context window with `Q4_K_M` weight quantization:

| Model Architecture | Quantization | Snapdragon 8 Elite (12GB) | Apple A18 Pro (8GB) | Performance Delta |
| :--- | :--- | :--- | :--- | :--- |
| **DeepSeek-R1-Distill-Qwen-1.5B** | `Q4_K_M` | **28.4 tok/s** | 22.8 tok/s | **+24.6% Qualcomm** |
| **Qwen-2.5-3B-Instruct** | `Q4_K_M` | **18.6 tok/s** | 14.2 tok/s | **+31.0% Qualcomm** |
| **Llama-3.2-3B-Instruct** | `Q4_K_M` | **19.2 tok/s** | 14.8 tok/s | **+29.7% Qualcomm** |
| **DeepSeek-R1-Distill-Qwen-7B** | `Q4_K_M` | **13.1 tok/s** | **CRASH (`EXC_RESOURCE`)** | **Snapdragon exclusive** |

---

## 3. Key Engineering Findings

1. **Memory Bandwidth Bottleneck:** Token decode speed is strictly DRAM bandwidth bound. The Snapdragon 8 Elite's 84.8 GB/s bus delivers a +41.3% bandwidth advantage over the A18 Pro's 60.0 GB/s actual tested throughput, driving a consistent ~25% to 31% lead across small models.
2. **Apple 8GB Jetsam Wall:** On 8GB iPhones, Apple's kernel Jetsam daemon enforces a hard 5.2GB memory ceiling (`EXC_RESOURCE`). When loading 7B parameter models (4.62GB weight + 650MB KV cache + Metal buffers), the app reaches ~5.29GB and is terminated instantly without warning.
3. **Thermal Throttling Decay:** Under a 10-minute continuous token generation load, Samsung's titanium vapor chamber retains **87.3%** of its initial speed (28.4 -> 24.8 tok/s, 41.2°C skin temp), while Apple's graphite stack drops to **71.1%** (22.8 -> 16.2 tok/s, 44.8°C skin temp).

---

## 4. Interactive Sizer Tool

To calculate memory headroom, KV cache sizing, and estimated tok/s across 40+ smartphone chipsets and 30+ open-weight LLMs, visit the [Mobile AI RAM & GGUF Compatibility Checker](https://techloverhd.com/tools/mobile-ai-ram-compatibility-checker/).
