#!/usr/bin/env bash

img="$HOME/.cache/swaylock.png"
#img="$HOME/.files/sway/.config/sway/lock-fullhd.png"

grim $img
#gm convert $img -scale 5% -scale 2000% $img
gm convert $img -blur 0x10 $img
swaylock -eFfk -i $img -s fill

rm -f $img
