
#!/bin/bash 
cd ~/
#install moos-ivp
sudo apt-get --assume-yes install g++  cmake  xterm subversion
sudo apt-get --assume-yes install libfltk1.3-dev  freeglut3-dev  libpng-dev  libjpeg-dev
sudo apt-get --assume-yes install libxft-dev  libxinerama-dev   libtiff5-dev
svn co https://oceanai.mit.edu/svn/moos-ivp-aro/trunk/ ~/moos-ivp
echo -e "\033[31m download moos-ivp done \033[0m"

#install moos-ivp-aquaticus
sudo apt-get --assume-yes install libncurses-dev
svn co https://oceanai.mit.edu/svn/moos-ivp-aquaticus-aro-trunk/trunk/ ~/moos-ivp-aquaticus 
echo -e "\033[31m download moos-ivp-aquaticus done \033[0m"

#download moos-ivp-cthung 
sudo apt-get --assume-yes install libasound2-dev
cd ../
git clone https://github.com/CT-Hung/moos-ivp-cthung.git
cd -
echo -e "\033[31m download moos-ivp-cthung done \033[0m"

#download moos-ivp-UAL
svn co svn://140.112.26.204/moos-ivp-UAL

#build
cd ~/moos-ivp 
./build.sh
cd ~/moos-ivp-cthung 
./build.sh 
cd ~/moos-ivp-UAL
./build.sh
cd ~/moos-ivp-aquaticus 
./build.sh 
echo -e "\033[31m install moos-ivp tree done \033[0m"
