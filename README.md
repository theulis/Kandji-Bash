# Kandji-Bash


## NX Vulnerability Checker

This script checks whether your system has a vulnerable version of the **NX** package installed. It specifically targets versions of NX that have been reported as compromised in popular npm packages.

For more details about the vulnerability, see this blog post: [Popular NX Packages Compromised on npm](https://www.aikido.dev/blog/popular-nx-packages-compromised-on-npm).

---

### Features

- Detects NX installations in common locations (`/opt/homebrew/bin/nx` and `/usr/local/bin/nx`).
- Checks both **global** and **local** NX versions.
- Compares versions against a list of known vulnerable versions.
- Returns clear exit codes:
  - `0` — NX is either not installed or not vulnerable.
  - `2` — Vulnerable NX version detected.

---
