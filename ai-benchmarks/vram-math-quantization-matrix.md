# Local LLM VRAM Math & Quantization Matrix (2026 Baseline)

Quantitative memory budgeting equations and measured VRAM benchmarks across modern quantization levels.

Canonical Guide: [Running DeepSeek-R1 and Llama 3 Locally: VRAM Math & Ollama Setup (TechLoverHD)](https://techloverhd.com/2026/10/run-deepseek-r1-llama-3-locally-vram-ollama-guide/)

---

## 1. The Core VRAM Formula

To calculate minimum required VRAM for any GGUF / GGML model:

$$VRAM_{total} = (Params_{billions} \times Bits_{quantized} / 8) + (Context_{tokens} \times Layers \times HiddenDim \times BytesPerToken) + VRAM_{overhead}$$

As a rule of thumb for standard 8K context windows:
- **Weights VRAM:** $\approx (Params \times Bits / 8) \times 1.15$
- **KV Cache VRAM:** $\approx 1.5\text{ GB}$ (8K context, FP16 KV cache)
- **CUDA Runtime Overhead:** $\approx 0.8\text{ GB}$

---

## 2. Quantization & VRAM Matrix

| Model Architecture | Parameters | Quantization | Model Weights Size | Minimum VRAM (8K Context) | Recommended Hardware |
| :--- | :--- | :--- | :--- | :--- | :--- |
| DeepSeek-R1 Distill Qwen | 1.5B | Q4_K_M | 1.1 GB | 2.5 GB | Mobile NPU / 4GB VRAM |
| DeepSeek-R1 Distill Qwen | 7B | Q4_K_M | 4.7 GB | 6.5 GB | RTX 3060 12GB / Apple M1 16GB |
| DeepSeek-R1 Distill Qwen | 7B | Q8_0 | 7.7 GB | 9.8 GB | RTX 4070 12GB / Apple M2 16GB |
| DeepSeek-R1 Distill Qwen | 14B | Q4_K_M | 9.0 GB | 11.5 GB | RTX 3060 12GB / RTX 4070 Ti Super 16GB |
| DeepSeek-R1 Distill Qwen | 32B | Q4_K_M | 20.0 GB | 23.5 GB | RTX 3090 / RTX 4090 24GB |
| Llama 3.1 / 3.2 | 8B | Q4_K_M | 4.9 GB | 7.0 GB | RTX 3060 12GB / Apple M-Series 16GB |
| Llama 3.1 | 70B | Q4_K_M | 43.0 GB | 48.0 GB | Dual RTX 3090 / Apple Studio 64GB |
