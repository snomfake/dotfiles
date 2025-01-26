#!/bin/sh

filename=$(date +"%Y-%m-%d_%H%M%S-$WIDTHx$HEIGHT.png")
scrot "$filename" -s -e 'mv $f /home/dolora/Images/Screenshots'
notify-send "Screenshot taken" -i "/home/dolora/.icons/gnome/48x48/Gnome-camera-photo.svg" --expire-time=1000
