# just a file so I will remember all the necessary steps to get
# this config running on a different pc

# install i3 gaps
sudo apt update


sudo apt install i3 feh fonts-powerline lxpolkit maim xclip

# we also need bumblebee to be installed!
echo "Cloning Bumblebee into ~/Sources/bumblebee-status"

git clone https://github.com/tobi-wan-kenobi/bumblebee-status.git /home/cedric/Sources/bumblebee-status

pip install psutil
pip install xkbgroup
