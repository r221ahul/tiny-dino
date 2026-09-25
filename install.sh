#!/usr/bin/env bash
set -e

cd "$(dirname "$(readlink -f "$0")")"

echo "🦖 Installing Tiny Dino..."

sudo apt update
sudo apt install -y python3 python3-venv python3-pip libportaudio2

python3 -m venv .venv
.venv/bin/python -m pip install --upgrade pip
.venv/bin/pip install -r requirements.txt

mkdir -p "$HOME/.local/share/applications"

cat > "$HOME/.local/share/applications/linux-desktop-pet.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=Tiny Dino
Comment=Lightweight Linux desktop companion
Exec=$PWD/.venv/bin/python $PWD/app.py
Icon=face-smile
Terminal=false
Categories=Utility;
DESKTOP

update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true

echo
echo "✅ Tiny Dino installed."
echo "Launching Tiny Dino..."
.venv/bin/python app.py
