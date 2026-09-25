# Linux Mint Desktop Pet

Lightweight Python 3 + PySide6 desktop pet for Cinnamon.

## Install

```bash
cd ~/linux-desktop-pet
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
.venv/bin/python app.py
```

The first launch creates `~/.config/autostart/linux-desktop-pet.desktop` automatically.

## Controls
- Left-click: start 45-minute focus
- Drag: move pet
- Double-click: open To-Do
- Right-click: sleep, focus, prompt, theme, quit
- Hover: speech bubble

## Sprites
Replace PNGs under `assets/idle`, `walk`, `sleep`, `read`, and `coffee` with your own 72x72-ish transparent frames.
