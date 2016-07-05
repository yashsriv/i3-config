#!/bin/bash
if [ -f /etc/debian_version ]; then
  pactl set-sink-volume 0 +5%
elif [ -f /etc/arch-release ]; then
  pulseaudio-ctl up
  pkill --signal SIGRTMIN+12 i3blocks
fi
