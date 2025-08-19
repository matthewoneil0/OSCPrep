#!/bin/bash

# Directory to store the tools
TOOLS_DIR="privesc-tools"
mkdir -p "$TOOLS_DIR"
cd "$TOOLS_DIR" || exit 1

# Download linPEAS if not already present
if [ ! -f linpeas.sh ]; then
    echo "[+] Downloading linPEAS..."
    wget -q https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh -O linpeas.sh
    chmod +x linpeas.sh
else
    echo "[*] linPEAS already exists, skipping."
fi

# Download winPEAS x64
if [ ! -f winPEASx64.exe ]; then
    echo "[+] Downloading winPEASx64..."
    wget -q https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASx64.exe -O winPEASx64.exe
else
    echo "[*] winPEASx64 already exists, skipping."
fi

# Download winPEAS x86
if [ ! -f winPEASx86.exe ]; then
    echo "[+] Downloading winPEASx86..."
    wget -q https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASx86.exe -O winPEASx86.exe
else
    echo "[*] winPEASx86 already exists, skipping."
fi

# Clone PowerUp if not already present
if [ ! -f PowerUp.ps1 ]; then
    echo "[+] Cloning PowerUp..."
    git clone --depth 1 https://github.com/PowerShellMafia/PowerSploit.git powersploit
    cp powersploit/Privesc/PowerUp.ps1 .
    rm -rf powersploit
else
    echo "[*] PowerUp.ps1 already exists, skipping."
fi

# Clone unix-privesc-check if not already cloned
if [ ! -d unix-privesc-check ]; then
    echo "[+] Cloning unix-privesc-check..."
    git clone --depth 1 https://github.com/pentestmonkey/unix-privesc-check unix-privesc-check
else
    echo "[*] unix-privesc-check already exists, skipping."
fi

# Ask the user if they want to start a Python HTTP server
read -rp "[?] Do you want to start a Python HTTP server on port 80? [y/N]: " START_SERVER

if [[ "$START_SERVER" =~ ^[Yy]$ ]]; then
    echo "[+] Starting Python HTTP server on port 80..."
    cd ..
    sudo python3 -m http.server 80
else
    echo "[*] Skipping Python HTTP server."
fi
