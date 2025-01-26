#!/bin/sh

# timedatectl set-local-rtc 1
xset s off -dpms
setxkbmap 'us,ru' -option 'grp:alt_shift_toggle'
feh --bg-scale ~/Images/Wallpapers/pinkRose.jpg
dunst &
dwmblocks &

exec dwm
