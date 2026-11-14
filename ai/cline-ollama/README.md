# Cline + Ollama Local AI Coding Agent Stack

Production-hardened configuration for running an autonomous, 100% private AI coding agent in VS Code using Cline and Ollama.

## Canonical Tutorial
Full step-by-step installation, VRAM sizing formulas, and benchmark comparisons:
**[Cline + Ollama Local AI Coding Agent (TechLoverHD)](https://techloverhd.com/2026/11/cline-ollama-local-ai-agent-guide/)**

## Included Files
- `Modelfile`: Custom model definition enforcing a 32,768-token context window (`num_ctx 32768`) and deterministic sampling (`temperature 0.15`) for `qwen2.5-coder:14b`.
- `ollama.service.d-override.conf`: Systemd override enabling Flash Attention (`OLLAMA_FLASH_ATTENTION=1`) and 8-bit quantized KV cache (`OLLAMA_KV_CACHE_TYPE=q8_0`).
- `.clinerules`: Repository root agent rules keeping 7B-32B local coding models sharp.
