#!/bin/bash

get_volume() {
    volume=$(pamixer --get-volume)
    echo "$volume"
}

inc_volume() {
    pamixer -i 5
}

dec_volume(){
    pamixer -d 5
}

toggle_mute() {
    if [ "$(pamixer --get-mute)" == "false" ]; then
		pamixer -m
	elif [ "$(pamixer --get-mute)" == "true" ]; then
		pamixer -u 
	fi
}

# Execute accordingly
if [[ "$1" == "--get" ]]; then
	get_volume
elif [[ "$1" == "--inc" ]]; then
	inc_volume
elif [[ "$1" == "--dec" ]]; then
	dec_volume
elif [[ "$1" == "--toggle" ]]; then
	toggle_mute
else
	get_volume
fi
