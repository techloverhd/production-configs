#!/usr/bin/env python3
"""
Continuous Origin Traffic Benchmark for Zero-Downtime Verification
"""

import subprocess
import threading
import time
import urllib.request

TARGET_URL = "https://example.com/"
errors: list[str] = []
successes = 0
is_running = True


def traffic_hammer() -> None:
    global successes, is_running
    while is_running:
        try:
            cache_buster = int(time.time() * 1000)
            req = urllib.request.Request(
                f"{TARGET_URL}?cb={cache_buster}",
                headers={"User-Agent": "ZeroDowntimeBench/1.0", "Cache-Control": "no-cache"},
            )
            with urllib.request.urlopen(req, timeout=5) as resp:
                if resp.status == 200:
                    successes += 1
                else:
                    errors.append(f"HTTP {resp.status}")
        except Exception as err:
            errors.append(str(err))
        time.sleep(0.1)


thread = threading.Thread(target=traffic_hammer, daemon=True)
thread.start()

print("Running live deployment under continuous 10 req/sec load...")
proc = subprocess.run(["npm", "run", "deploy"], capture_output=True, text=True)
is_running = False
thread.join()

print(proc.stdout)
print("-" * 54)
print(f"Total Requests Sent:          {successes + len(errors)}")
print(f"Successful 200 OK Responses:  {successes}")
print(f"Failed / 502 Gateway Errors:  {len(errors)}")
print("-" * 54)

if not errors:
    print("RESULT: 100.0% Uptime verified across the entire deployment.")
else:
    print(f"ALERT: {len(errors)} failed requests detected: {errors[:5]}")
