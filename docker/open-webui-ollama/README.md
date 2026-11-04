# Self-Hosted Open WebUI, Ollama & SearXNG

Private ChatGPT replacement running 100% locally with Ollama hardware acceleration, web browsing retrieval via SearXNG, and model management.

Full step-by-step walkthrough: [Self-Hosting Private ChatGPT with Open WebUI in Docker (TechLoverHD)](https://techloverhd.com/2026/10/self-host-open-webui-ollama-searxng-docker-guide/)

## Quick Start

1. Start the stack:
   ```bash
   docker compose up -d
   ```
2. Pull your desired models via terminal:
   ```bash
   docker exec -it ollama ollama run deepseek-r1:7b
   docker exec -it ollama ollama run llama3.1:8b
   ```
3. Open `http://<your-server-ip>:3000` to set up your admin user.
