#!/bin/bash

# ========== 1. Install Go ==========
GO_VERSION="1.24.2"
GO_TAR="go${GO_VERSION}.linux-amd64.tar.gz"
GO_URL="https://go.dev/dl/${GO_TAR}"

if ! command -v go >/dev/null 2>&1; then
    echo "[*] Downloading and installing Go ${GO_VERSION}..."
    wget "${GO_URL}" -O "${GO_TAR}" || { echo "Download failed!"; exit 1; }
    sudo rm -rf /usr/local/go
    sudo tar -C /usr/local -xzf "${GO_TAR}"
    rm -f "${GO_TAR}"
else
    echo "[*] Go is already installed:"
    go version
fi

# ========== 2. Set up PATHs in .zshrc ==========
if ! grep -q "/usr/local/go/bin" ~/.zshrc; then
    echo "[*] Adding /usr/local/go/bin to ~/.zshrc"
    echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
fi

if ! grep -q "\$HOME/go/bin" ~/.zshrc; then
    echo "[*] Adding ~/go/bin to ~/.zshrc"
    echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.zshrc
fi

# Set PATH for current session
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin

# ========== 3. Install Go-based Tools Conditionally ==========
install_go_tool() {
    TOOL=$1
    PACKAGE=$2
    if ! command -v "$TOOL" >/dev/null 2>&1; then
        echo "[*] Installing $TOOL..."
        go install "$PACKAGE"@latest
    else
        echo "[*] $TOOL already installed — skipping."
    fi
}

echo "[*] Installing Go-based tools (if not already installed)..."
install_go_tool subfinder github.com/projectdiscovery/subfinder/v2/cmd/subfinder
install_go_tool httpx github.com/projectdiscovery/httpx/cmd/httpx
install_go_tool gf github.com/tomnomnom/gf
install_go_tool anew github.com/tomnomnom/anew
install_go_tool gau github.com/lc/gau
install_go_tool katana github.com/projectdiscovery/katana/cmd/katana
install_go_tool gospider github.com/jaeles-project/gospider
install_go_tool subjs github.com/lc/subjs
install_go_tool waybackurls github.com/tomnomnom/waybackurls

# ========== 4. Install Python Tools via apt ==========
echo "[*] Installing Python-based tools via apt..."
sudo apt-get update
sudo apt-get install -y sublist3r arjun dirsearch

# ========== 5. Summary ==========
echo "[+] Installation complete. Tools checked/installed:"
echo "  - subfinder, httpx, gau, anew, gf, katana, gospider, subjs, waybackurls"
echo "  - sublist3r, arjun, dirsearch (via apt)"
echo
echo "[*] Make sure your PATH is set. Run this to apply it now:"
echo "    source ~/.zshrc"
