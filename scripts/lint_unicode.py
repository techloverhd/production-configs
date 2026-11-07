#!/usr/bin/env python3
"""
Production Configs Invisible Unicode & Syntax Linter
Detects and blocks fatal non-breaking spaces (U+00A0) and zero-width spaces (U+200B).
"""

import os
import sys

ROOT_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

SUSPECT_PATTERNS = {
    b"\xc2\xa0": "U+00A0 (Non-Breaking Space - breaks YAML/Python indentation)",
    b"\xe2\x80\x8b": "U+200B (Zero-Width Space - breaks Markdown/MDX lists)",
    b"\xe2\x80\x8c": "U+200C (Zero-Width Non-Joiner)",
    b"\xe2\x80\x8d": "U+200D (Zero-Width Joiner)",
    b"\xef\xbb\xbf": "U+FEFF (Byte Order Mark)",
}

errors = 0

for root, dirs, files in os.walk(ROOT_DIR):
    if ".git" in root:
        continue
    for file in files:
        filepath = os.path.join(root, file)
        try:
            with open(filepath, "rb") as f:
                data = f.read()
            for b_seq, desc in SUSPECT_PATTERNS.items():
                if b_seq in data:
                    count = data.count(b_seq)
                    print(f"[FAIL] {os.path.relpath(filepath, ROOT_DIR)}: {count} occurrence(s) of {desc}", file=sys.stderr)
                    errors += 1
        except Exception as e:
            print(f"[WARN] Could not read {filepath}: {e}", file=sys.stderr)

if errors == 0:
    print("[PASS] All production configs & markdown files are 100% clean of invisible unicode characters.")
    sys.exit(0)
else:
    print(f"\n[ERROR] Found {errors} file(s) with forbidden invisible unicode characters!", file=sys.stderr)
    sys.exit(1)
