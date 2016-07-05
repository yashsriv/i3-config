#!/bin/bash
if [ -f /etc/debian_version ]; then
  pactl set-sink-mute 0 toggle
elif [ -f /etc/arch-release ]; then
  pulseaudio-ctl mute && pkill --signal SIGRTMIN+12 i3blocks
fi
