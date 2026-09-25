#!/usr/bin/env bash
set -e

cd "$(dirname "$(readlink -f "$0")")"

echo "🦖 Installing Tiny Dino..."

sudo apt update
sudo apt install -y python3 python3-venv python3-pip libportaudio2

python3 -m venv .venv
.venv/bin/python -m pip install --upgrade pip
.venv/bin/pip install -r requirements.txt

# Optional Ask Dino API keys.
CONFIG_DIR="$HOME/.config/linux-desktop-pet"
mkdir -p "$CONFIG_DIR"
chmod 700 "$CONFIG_DIR"

echo
echo "Ask Dino setup (optional). Press Enter to skip."
read -r -s -p "Groq API key: " GROQ_KEY
echo
if [ -n "$GROQ_KEY" ]; then
    printf '%s\n' "$GROQ_KEY" > "$CONFIG_DIR/groq.key"
    chmod 600 "$CONFIG_DIR/groq.key"
    echo "✅ Groq key saved locally."
fi

read -r -s -p "Tavily API key: " TAVILY_KEY
echo
if [ -n "$TAVILY_KEY" ]; then
    printf '%s\n' "$TAVILY_KEY" > "$CONFIG_DIR/tavily.key"
    chmod 600 "$CONFIG_DIR/tavily.key"
    echo "✅ Tavily key saved locally."
fi

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
