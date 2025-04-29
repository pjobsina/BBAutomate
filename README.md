# BBInstallAutomate

**Bug Bounty Tool Installation Automation for Linux and Kali Linux**

BBInstallAutomate is a simple automation script designed to quickly set up essential bug bounty and reconnaissance tools on Linux systems, especially Kali Linux.
It handles installation, environment setup, and ensures that your machine is ready for hacking and recon in minutes.

---

## ✨ Features
- **Automatic Go installation** (version: `1.24.2`)
- **PATH setup** for `/usr/local/go/bin` and `$HOME/go/bin`
- **Conditional installation** of essential Go-based tools:
  - [subfinder](https://github.com/projectdiscovery/subfinder)
  - [httpx](https://github.com/projectdiscovery/httpx)
  - [gf](https://github.com/tomnomnom/gf)
  - [anew](https://github.com/tomnomnom/anew)
  - [gau](https://github.com/lc/gau)
  - [katana](https://github.com/projectdiscovery/katana)
  - [gospider](https://github.com/jaeles-project/gospider)
  - [subjs](https://github.com/lc/subjs)
  - [waybackurls](https://github.com/tomnomnom/waybackurls)
  - [subzy](https://github.com/LukaSikic/subzy)
- **APT package installation** for Python-based tools:
  - [sublist3r](https://github.com/aboul3la/Sublist3r)
  - [arjun](https://github.com/s0md3v/Arjun)
  - [dirsearch](https://github.com/maurosoria/dirsearch)

---

## ⚡ Usage

```bash
git clone https://github.com/yourusername/BBAutomate.git
cd BBAutomate
chmod +x bbautomate.sh
./bbautomate.sh
```

After running, apply the environment changes:

```bash
source ~/.zshrc
```

---

## 📋 Notes
- Designed for **Linux distributions** (Ubuntu, Debian, Kali, Parrot, etc.)
- Tested on **Kali Linux 2024**.
- Script automatically checks if each tool is already installed before installing.

---

## 🚀 Coming Soon
- Auto-update feature
- Support for Bash-only environments without Zsh
- Additional tools for bug bounty automation

---

## 💜 Credits
Created by [Your Name or Username] - Contributions are welcome!
