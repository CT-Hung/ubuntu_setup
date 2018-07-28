#!/bin/bash 


#install tmux 
sudo apt-get install tmux
#install fisa_vim
sudo apt-get install curl vim exuberant-ctags git ack-grep
sudo pip install pep8 flake8 pyflakes isort yapf
echo -e "\033[31m install fisa_vim done \033[0m"

#install moos-ivp
sudo apt-get install g++  cmake  xterm subversion
sudo apt-get install libfltk1.3-dev  freeglut3-dev  libpng-dev  libjpeg-dev
sudo apt-get install libxft-dev  libxinerama-dev   libtiff5-dev
svn co https://oceanai.mit.edu/svn/moos-ivp-aro/trunk/ ~/moos-ivp
echo -e "\033[31m install moos-ivp done \033[0m"

#download moos-ivp-cthung 
sudo apt-get install libasound2-dev
cd ../
git clone https://github.com/CT-Hung/moos-ivp-cthung.git
cd -
echo -e "\033[31m install moos-ivp-cthung done \033[0m"

#move dotfile 
cp .bashrc .tmux.conf .vimrc ~/ 
cp -rp .bash_it ~/
source ~/.bashrc
echo -e "\033[31m install bash done \033[0m"

#add git params
git config --global user.name "CT-Hung"
git config --global user.email "poilkj09862@gmail.com"
git config --global alias.st 'status'
git config --global alias.cm 'commit -m'
echo -e "\033[31m add git params done \033[0m"

#check package
dpkg -l tmux curl vim exuberant-ctags git ack-grep g++ cmake xterm subversion libfltk1.3-dev freeglut3-dev libpng-dev libjpeg-dev libxft-dev libxinerama-dev libtiff5-dev libasound2-dev 


