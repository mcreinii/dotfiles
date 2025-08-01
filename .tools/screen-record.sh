#!/bin/bash

# Get screen resolution using xdpyinfo
if ! command -v xdpyinfo &> /dev/null; then
    echo "xdpyinfo not found. Install it with: sudo pacman -S xorg-xdpyinfo"
    exit 1
fi

RESOLUTION=$(xdpyinfo | awk '/dimensions:/ {print $2}')

# Prompt for FPS
read -p "Enter framerate (FPS, e.g. 30): " FPS

# Set output filename with timestamp
FILENAME="record-$(date +%Y%m%d-%H%M%S).mkv"

# Start recording screen + audio
ffmpeg \
-f x11grab -s "$RESOLUTION" -framerate "$FPS" -i :0.0 \
-f pulse -i default \
-c:v libx264 -preset ultrafast -c:a aac "$FILENAME"
