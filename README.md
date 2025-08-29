# Kandji-Bash


## NX Vulnerability Checker

```bash
NX-Vulnerability-Simple-Check.sh
```

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

## Check SSH Status

This script checks whether SSH (Remote Login) is enabled on a macOS system.  
- If SSH is enabled, it prints a warning message with an emoji and exits with code `2`.  
- If SSH is disabled, it confirms that the system is in a safe state and exits with code `0`.

Kandji has a Library item where you can manage SSH settings:
[Configure the SSH Library Item](https://support.kandji.io/kb/configure-the-ssh-library-item)


