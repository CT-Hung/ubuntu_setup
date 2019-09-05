#!/bin/bash 

#install tmux 
sudo apt-get --assume-yes install tmux
#install fisa_vim
sudo apt-get --assume-yes install curl vim exuberant-ctags git ack-grep
sudo pip install pep8 flake8 pyflakes isort yapf
echo -e "\033[31m install fisa_vim done \033[0m"

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
