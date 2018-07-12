DIR=/vol/configs
ln -s $DIR/.emacs ~/
ln -s $DIR/.emacs.d ~/
ln -s $DIR/.tmux.conf ~/
sudo apt install xubuntu-desktop
# sudo cp /vol/configs/xrdp.ini /etc/xrdp/xrdp.ini
echo xfce4-session >~/.xsession
cp /vol/xstartup ~/.vnc
# make a copy of the relevant library
mkdir ~/lib
cp /usr/lib/x86_64-linux-gnu/libxcb.so.1 ~/lib
sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' ~/lib/libxcb.so.1
# set the dynamic loader path to put your library first before executing VS Code
echo LD_LIBRARY_PATH=$HOME/lib code >> ~/code.sh

sudo apt install cmake libboost-dev libboost-filesystem-dev libboost-system-dev
sudo apt install gcc g++
