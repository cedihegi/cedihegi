#!/bin/bash
# some commands were not actually executed sometimes.. well no longer

log() {
    if [[ "$DEBUG_I3" == "true" ]]; then
        echo "$(date) - $1" >> ~/script.log
    fi
}

# wait for system setup
sleep 2




touch ~/script.log
log "execute.sh is executed"

# bash /home/cedric/.screenlayout/gnome.sh
# feh --bg-scale /home/cedric/Pictures/Wallpapers/surfing2.jpg --bg-scale /home/cedric/Pictures/Wallpapers/vertical-rose.jpeg

# log "background setup concluded"

# switch caps lock and escape:
setxkbmap -option caps:escape_shifted_capslock
log "made scape another caps lock"
setxkbmap -option grp:alt_shift_toggle ch,us
log "setup of different keyboard layouts"

# picom -CGb
# log "started picom"
