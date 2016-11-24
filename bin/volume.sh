#!/bin/bash

case $1 in
  up )
    pulseaudio-ctl up || pactl set-sink-volume 0 -- +5%
    pkill --signal SIGRTMIN+12 i3blocks
    ;;
  down )
    pulseaudio-ctl down || pactl set-sink-volume 0 -- -5%
    pkill --signal SIGRTMIN+12 i3blocks
    ;;
  mute )
    pulseaudio-ctl mute || pactl set-sink-mute 0 toggle
    pkill --signal SIGRTMIN+12 i3blocks
    ;;
esac
