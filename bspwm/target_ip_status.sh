#!/bin/bash
ip_address=$(/bin/cat ~/.config/bspwm/scripts/target_ip | awk '{print $1}')
 
if [ $ip_address ]; then
    echo "%{F#e51d0b}󰓾%{F#ffffff} $ip_address%{u-}"
else
    echo "%{F#e51d0b}󰓾%{u-}%{F#ffffff} No target"
fi