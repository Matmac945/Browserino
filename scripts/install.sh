#!/usr/bin/env bash
# Install (or reinstall) the latest Linkraptor into /Applications:
#
#   curl -fsSL https://raw.githubusercontent.com/Matmac945/Linkraptor/main/scripts/install.sh | bash
#
# After this, Linkraptor updates itself.
set -euo pipefail

URL="https://github.com/Matmac945/Linkraptor/releases/latest/download/Linkraptor.dmg"
TMP="$(mktemp -d)"
trap 'hdiutil detach -quiet "$TMP/mnt" 2>/dev/null || true; rm -rf "$TMP"' EXIT

echo "Downloading Linkraptor…"
curl -fsSL "$URL" -o "$TMP/Linkraptor.dmg"

hdiutil attach -quiet -nobrowse -mountpoint "$TMP/mnt" "$TMP/Linkraptor.dmg"

osascript -e 'quit app "Linkraptor"' 2>/dev/null || true
rm -rf /Applications/Linkraptor.app
ditto "$TMP/mnt/Linkraptor.app" /Applications/Linkraptor.app
xattr -dr com.apple.quarantine /Applications/Linkraptor.app 2>/dev/null || true

echo "Installed to /Applications/Linkraptor.app"
open /Applications/Linkraptor.app
echo "Last step: set Linkraptor as your default browser in System Settings > Desktop & Dock > Default web browser."
