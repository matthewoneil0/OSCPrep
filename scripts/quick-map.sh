#!/bin/bash

# Check if target IP is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <target_ip>"
  exit 1
fi

TARGET_IP="$1"

# Step 1: Full scan of all ports (including filtered)
echo "[*] Running full scan on $TARGET_IP to detect open and filtered ports..."
PORT_SCAN_OUTPUT=$(sudo nmap -p- --min-rate=1000 -T4 -n "$TARGET_IP")

# Step 2: Extract open and filtered ports
echo "[*] Extracting open and filtered ports..."
OPEN_FILTERED_PORTS=$(echo "$PORT_SCAN_OUTPUT" | grep "^PORT" -A 10000 | grep -E "open|filtered" | cut -d'/' -f1 | tr '\n' ',' | sed 's/,$//')

if [ -z "$OPEN_FILTERED_PORTS" ]; then
  echo "[!] No open or filtered ports found."
  exit 1
fi

echo "[*] Open/Filtered ports found: $OPEN_FILTERED_PORTS"

# Step 3: Run detailed scan on those ports
echo "[*] Running detailed scan on ports: $OPEN_FILTERED_PORTS"
sudo nmap -p"$OPEN_FILTERED_PORTS" -sC -sV -A -T4 "$TARGET_IP" > nmap_detailed.txt

echo "[*] Detailed scan complete. Results saved in nmap_detailed.txt"

