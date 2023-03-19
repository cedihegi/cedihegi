# some commands were not actually executed sometimes.. well no longer


# no need on laptop..
# bash /home/cedric/.screenlayout/gnome.sh

# only one screen on laptop
# feh --bg-scale /home/cedric/Pictures/Wallpapers/surfing2.jpg --bg-scale /home/cedric/Pictures/Wallpapers/vertical-rose.jpeg
exec_always --no-startup-id feh --bg-scale /home/cedric/Pictures/wallpaper.jpg


# switch caps lock and escape:
setxkbmap -option caps:escape_shifted_capslock
setxkbmap -option grp:alt_shift_toggle us,ch

picom -CGb
