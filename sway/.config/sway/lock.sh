#!/usr/bin/env bash

img="$HOME/.cache/swaylock.png"

grim $img
gm convert $img -scale 5% -scale 2000% $img
swaylock -eFfk -i $img -s fill

rm -f $img
