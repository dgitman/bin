#!/usr/bin/env python3
"""Run curl with the bundled transfer timing format file."""

from pathlib import Path
import subprocess
import sys


def main() -> int:
    script_dir = Path(__file__).resolve().parent
    url = sys.argv[1] if len(sys.argv) > 1 else "https://wordpress.com/"

    return subprocess.call(
        [
            "curl",
            "-w",
            f"@{script_dir / 'curl-format.txt'}",
            "-o",
            "/dev/null",
            "-sS",
            url,
        ]
    )


if __name__ == "__main__":
    raise SystemExit(main())
