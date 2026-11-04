# Snapdragon 8 Elite Mobile NPU & CPU LLM Benchmarks

Empirical local inference benchmarks measured on real hardware: **Samsung Galaxy S25 Ultra (Snapdragon 8 Elite, 12GB LPDDR5X RAM, 1TB UFS 4.0 Storage)** running PocketPal AI and llama.cpp runtime (Android 16/17).

Canonical Guide: [Run DeepSeek-R1 and Llama 3 Locally on Android Without Internet (TechLoverHD)](https://techloverhd.com/2026/10/run-local-ai-android-apk-pocketpal-offline-guide/)

---

## Benchmark Results (Tokens per Second)

| Model Name | Quantization | Size on Disk | Prompt Eval Speed | Generation Speed | Peak Memory | Thermal Stability |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| DeepSeek-R1-Distill-Qwen-1.5B | Q4_K_M | 1.12 GB | 142.5 t/s | **31.2 t/s** | 1.6 GB | Cool (< 36°C) |
| Llama-3.2-1B-Instruct | Q4_K_M | 0.88 GB | 168.0 t/s | **38.4 t/s** | 1.3 GB | Cool (< 35°C) |
| Llama-3.2-3B-Instruct | Q4_K_M | 2.02 GB | 85.2 t/s | **18.7 t/s** | 2.8 GB | Warm (39°C) |
| DeepSeek-R1-Distill-Qwen-7B | Q4_K_M | 4.68 GB | 34.1 t/s | **7.8 t/s** | 5.8 GB | Warm (41°C) |
| Llama-3.1-8B-Instruct | Q4_K_M | 4.92 GB | 29.5 t/s | **6.9 t/s** | 6.2 GB | Warm (42°C) |

*All benchmarks executed with 2048 token context window, 4 CPU threads, temperature 0.6, battery saver disabled.*
