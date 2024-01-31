# wait a moment for startup to be over
sleep 2

bash /home/cedric/.screenlayout/gnome.sh
feh --bg-scale /home/cedric/Pictures/Wallpapers/surfing2.jpg --bg-scale /home/cedric/Pictures/Wallpapers/vertical-rose.jpeg


# switch caps lock and escape:
setxkbmap -option caps:escape_shifted_capslock
setxkbmap -option grp:alt_shift_toggle us,ch

picom -CGb
