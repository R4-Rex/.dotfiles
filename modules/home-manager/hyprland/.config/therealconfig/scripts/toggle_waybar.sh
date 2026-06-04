#!/usr/bin/env bash

if pgrep -a waybar > /dev/null; then
  pkill waybar
else
  waybar &
fi
