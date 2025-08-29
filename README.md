# Kandji-Bash


## NX Vulnerability Checker

```bash
NX-Vulnerability-Simple-Check.sh
```

This script checks whether your system has a vulnerable version of the **NX** package installed. It specifically targets versions of NX that have been reported as compromised in popular npm packages.

For more details about the vulnerability, see this blog post: [Popular NX Packages Compromised on npm](https://www.aikido.dev/blog/popular-nx-packages-compromised-on-npm).

- Detects NX installations in common locations (`/opt/homebrew/bin/nx` and `/usr/local/bin/nx`).
- Checks both **global** and **local** NX versions.
- Compares versions against a list of known vulnerable versions.
- Returns clear exit codes:
  - `0` — NX is either not installed or not vulnerable.
  - `2` — Vulnerable NX version detected.

## Check SSH Status

```bash
SSH-Check.sh
```

This script checks whether SSH (Remote Login) is enabled on a macOS system.  
- If SSH is enabled, it prints a warning message with an emoji and exits with code `2`.  
- If SSH is disabled, it confirms that the system is in a safe state and exits with code `0`.

Kandji has a Library item where you can manage SSH settings:
[Configure the SSH Library Item](https://support.kandji.io/kb/configure-the-ssh-library-item)

## Check macOS version - Compliance

```bash
macOS-Version-Check.sh
```

This script checks the macOS version installed and sends a message to the end user reminding them that they do not run the latest macOS version 

[Display Alerts] (https://support.kandji.io/kb/kandji-agent-command-line-interface#alert) 

## Check macOS Battery

```bash
Laptop-Battery-Check.sh
```

This script checks the Laptop Battery Status. Kandji Self Services gives General Power info (Charge + Health), but not detailed. This script can be used as a Kandji Self-Service item

```
Battery Charge: 100 %
Design Capacity: 6075 mAh
AppleRawMaxCapacity: 4866 mAh
Battery Health: 80.00%
Load Cycles: 320
Battery Temperature: 35.15 °C
```
