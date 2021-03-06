
#!/bin/bash 
cd ~/ 
sudo apt --assume-yes update
sudo apt --assume-yes full-upgrade

#Setup and install dependenceies
sudo sh -c 'echo "deb  http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
sudo apt update
DIST=melodic
GAZ=gazebo9
sudo apt --assume-yes install cmake mercurial git ruby libeigen3-dev ${GAZ} lib${GAZ}-dev pkg-config python ros-${DIST}-gazebo-plugins ros-${DIST}-gazebo-ros ros-${DIST}-hector-gazebo-plugins ros-${DIST}-joy ros-${DIST}-joy-teleop ros-${DIST}-key-teleop ros-${DIST}-robot-localization ros-${DIST}-robot-state-publisher ros-${DIST}-rviz ros-${DIST}-ros-base ros-${DIST}-teleop-tools ros-${DIST}-teleop-twist-keyboard ros-${DIST}-velodyne-simulator ros-${DIST}-xacro ros-${DIST}-rqt ros-${DIST}-rqt-common-plugins protobuf-compiler

#Install ntu_vrx dependenceies
sudo apt-get --assume-yes install librapidxml-dev
sudo add-apt-repository --yes ppa:v-launchpad-jochen-sprickerhof-de/pcl
sudo apt-get --assume-yes update
sudo apt-get --assume-yes install libpcl-dev
sudo apt install --assume-yes ros-melodic-pcl-ros

#clone ntu_vrx
cd ~/ 
git clone https://github.com/CT-Hung/ntu_vrx.git

#Clone vrx 
mkdir -p ~/ntu_vrx/vrx_ws/src/ 
cd ~/ntu_vrx/vrx_ws/src/
hg clone https://bitbucket.org/osrf/vrx 

#Install vrx 
source /opt/ros/melodic/setup.bash
cd ~/ntu_vrx/vrx_ws/
catkin_make

#Install ntu_vrx
cd ~/ntu_vrx/moos-ivp-ntuvrx
./build.sh
cd ../catkin_ws
catkin_make
