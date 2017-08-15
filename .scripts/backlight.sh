#!/bin/bash

brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
inc="$1"

echo $(($brightness + $inc)) | sudo tee /sys/class/backlight/intel_backlight/brightness

if [ $brightness -gt $max_brightness ]
then
	echo $max_brightness | sudo tee /sys/class/backlight/intel_backlight/brightness
fi
