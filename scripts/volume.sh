#!/bin/sh

mutecmd() {
  pactl set-sink-mute 0 toggle
}

upcmd() {
  if [ "$(pactl get-sink-volume 0 | awk '{print $5}' )" == "100%" ]; then
    echo " "
  else
    pactl set-sink-volume 0 +5%
  fi
}

downcmd() {
  pactl set-sink-volume 0 -5%
}

if [ "$1" = "mute" ]; then
  mutecmd
elif [ "$1" = "up" ]; then
  upcmd
else
  downcmd
fi

msgTag="volumechange"

volume="$(pactl get-sink-volume 0 | awk '{print $5}' )"
mute="$(pactl get-sink-mute 0 | awk '{print $2}' )"

iconMute="$HOME/.icons/gnome/48x48/Gnome-audio-volume-muted.svg"
iconUp="$HOME/.icons/gnome/48x48/Gnome-audio-volume-high.svg"

if [ "$mute" = "yes" ]; then
    notify-send -a "changeVolume" -h string:x-dunst-stack-tag:$msgTag "Volume muted" -i "$iconMute" --expire-time=1000
else
    notify-send -a "changeVolume" -h string:x-dunst-stack-tag:$msgTag -h int:value:"$volume" "${volume}" -i "$iconUp" --expire-time=1000
fi
