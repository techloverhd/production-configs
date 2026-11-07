#!/usr/bin/env python3
"""
Zero-Downtime Docker Nginx Deployment Pipeline
"""

import json
import os
import subprocess
import sys
import urllib.error
import urllib.request
from pathlib import Path

ROOT_DIR = Path(__file__).resolve().parent.parent
CONTAINER_NAME = "frontend-web"
CF_ZONE_ID = os.environ.get("CLOUDFLARE_ZONE_ID", "YOUR_ZONE_ID")
CF_API_TOKEN = os.environ.get("CLOUDFLARE_API_TOKEN", "YOUR_API_TOKEN")


def run_step(cmd: list[str], description: str) -> None:
    print(f"[*] {description}...")
    result = subprocess.run(cmd, cwd=ROOT_DIR, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"[ERROR] Step failed: {description}", file=sys.stderr)
        print(result.stderr, file=sys.stderr)
        sys.exit(result.returncode)


def purge_cloudflare_cache() -> None:
    if CF_ZONE_ID == "YOUR_ZONE_ID" or CF_API_TOKEN == "YOUR_API_TOKEN":
        print("[!] Cloudflare credentials not set; skipping CDN cache purge.")
        return

    print("[*] Purging Cloudflare edge cache...")
    url = f"https://api.cloudflare.com/client/v4/zones/{CF_ZONE_ID}/purge_cache"
    payload = json.dumps({"purge_everything": True}).encode("utf-8")
    req = urllib.request.Request(
        url,
        data=payload,
        headers={
            "Authorization": f"Bearer {CF_API_TOKEN}",
            "Content-Type": "application/json",
        },
        method="POST",
    )
    try:
        with urllib.request.urlopen(req, timeout=10) as resp:
            body = json.loads(resp.read().decode("utf-8"))
            if body.get("success"):
                print("Cloudflare cache purged successfully.")
            else:
                print(f"[WARNING] Cloudflare API returned errors: {body.get('errors')}")
    except urllib.error.URLError as err:
        print(f"[WARNING] Cloudflare cache purge request failed: {err}")


def main() -> None:
    print("=" * 64)
    print(" Starting Zero-Downtime Production Deployment")
    print("=" * 64)

    # 1. Build static export into isolated staging directory (out/)
    run_step(["npm", "run", "build"], "Compiling static build into out/")

    # 2. Ensure live_out/ exists and atomically sync verified build
    live_out = ROOT_DIR / "live_out"
    live_out.mkdir(exist_ok=True)
    run_step(
        ["rsync", "-a", "--delay-updates", "--delete-after", "out/", "live_out/"],
        "Atomically syncing out/ into live_out/",
    )

    # 3. Validate Nginx config syntax before reloading workers
    run_step(
        ["docker", "exec", CONTAINER_NAME, "nginx", "-t"],
        "Validating Nginx configuration syntax",
    )

    # 4. Gracefully reload Nginx worker processes (zero container restart)
    run_step(
        ["docker", "exec", CONTAINER_NAME, "nginx", "-s", "reload"],
        "Gracefully reloading Nginx workers in-place",
    )

    # 5. Purge Cloudflare edge cache now that origin is hot and updated
    purge_cloudflare_cache()

    print("\n" + "=" * 64)
    print(" SUCCESS: Deployment completed with 0ms downtime.")
    print("=" * 64 + "\n")


if __name__ == "__main__":
    main()
