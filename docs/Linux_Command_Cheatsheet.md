# Linux Command Cheat Sheet

Beginner-friendly commands for system exploration. Some commands and output vary by distribution.

## Identify the system
```bash
uname -a
cat /etc/os-release
```

## Disk and memory overview
```bash
df -h
free -h
```

## Network overview
```bash
ip addr
ip route
ping -c 4 1.1.1.1
```

## Processes and uptime
```bash
top
uptime
```

## Storage devices (listing only)
```bash
lsblk
```

## System logs (systemd-based distributions)
```bash
journalctl -p err -b
```

## Package management examples
Debian / Ubuntu:
```bash
apt list --upgradable
```

Fedora:
```bash
dnf check-update
```

Arch Linux:
```bash
checkupdates
```

## Safety reminders
- Check your distribution's official documentation.
- Read commands before running them, especially with `sudo`.
- Avoid destructive commands copied from untrusted websites.
- Do not publish usernames, hostnames, IP addresses, logs, or other private information without reviewing them.
