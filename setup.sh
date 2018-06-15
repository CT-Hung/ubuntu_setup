#!/bin/bash 

#install tmux 
sudo apt-get install tmux
#install fisa_vim
sudo apt-get install curl vim exuberant-ctags git ack-grep
sudo pip install pep8 flake8 pyflakes isort yapf
echo "install fisa_vim done"

#install libinputgestures
sudo apt-get install libinput-tools
git clone https://github.com/bulletmark/libinput-gestures.git
cd libinput-gestures 
sudo make install 
cd - 
mv ./libinput-gestures.conf ../.config/
libinput-gestures-setup restart
echo "install libinput-gestures done"

#install moos-ivp
sudo apt-get install g++  cmake  xterm subversion
sudo apt-get install libfltk1.3-dev  freeglut3-dev  libpng12-dev  libjpeg-dev
sudo apt-get install libxft-dev  libxinerama-dev   libtiff5-dev
svn co https://oceanai.mit.edu/svn/moos-ivp-aro/trunk/ ~/moos-ivp
cd ~/moos-ivp/ 
./build-moos.sh
echo "done build-moos"
./build-ivp.sh 
echo "done build-ivp"
cd - 
echo "done buile moos tree"

#move dotfile 
mv .bashrc .tmux.conf .vimrc ~/ 
source ~/.bashrc
