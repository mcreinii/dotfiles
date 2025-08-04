#!/bin/bash

# Check if xdpyinfo is installed
if ! command -v xdpyinfo &> /dev/null; then
    echo "❌ xdpyinfo not found. Install it with: sudo pacman -S xorg-xdpyinfo"
    exit 1
fi

# Get screen resolution using xdpyinfo
read RES_X RES_Y <<< $(xdpyinfo | awk '/dimensions:/ {split($2, res, "x"); print res[1], res[2]}')

# Ensure height is even (libx264 requirement)
RES_Y=$(( RES_Y / 2 * 2 ))
RESOLUTION="${RES_X}x${RES_Y}"

# Prompt for FPS
read -p "🎥 Enter framerate (FPS, e.g. 30): " FPS

# Set output filename with timestamp
FILENAME="record-$(date +%Y%m%d-%H%M%S).mp4"

# Start recording
echo "🟢 Recording started... Press Ctrl+C to stop."
ffmpeg \
-f x11grab -video_size "$RESOLUTION" -framerate "$FPS" -i :0.0 \
-f pulse -i default \
-c:v libx264 -preset ultrafast -pix_fmt yuv420p \
-c:a aac -b:a 160k \
"$FILENAME"

# Done message
echo "✅ Recording saved as $FILENAME"

