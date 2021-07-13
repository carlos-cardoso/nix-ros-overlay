#!/usr/bin/env bash
set -euo pipefail

# Install Nix: https://nixos.org/nix/download.html
# bash <(curl -L https://nixos.org/nix/install)
#
# (Optional) configure Nix to use ROS Cachix binary cache
# nix-env -iA cachix -f https://cachix.org/api/v1/install
# cachix use ros
#
# git clone https://github.com/lopsided98/nix-ros-overlay.git
# cd nix-ros-overlay
# git checkout 54fb4baeb206eead92ba68a9a593c3607c1c4f8c

# sh load_kinect_shell.sh
# mkdir catkin_ws && cd catkin_ws
# catkin_init_workspace
# mkdir src && cd src
# git clone https://github.com/OpenKinect/libfreenect2.git
# cd libfreenect2
# git checkout fd64c5d9b214df6f6a55b4419357e51083f15d93
#
# mkdir build && cd build && cmake .. && make && sudo make install
# cd ../..
#
# git clone https://github.com/ros-perception/image_transport_plugins
# cd image_transport_plugins
# git checkout 0162f74e389d139b571d395c0bbb3c8b9d013a94
# cd ..
#
# git clone https://github.com/TheEngineRoom-UniGe/iai_kinect2.git
# cd iai_kinect2
# git checkout 09612539245053bd99b48cf5dda0b951f8e6bb39
# cd ..
#
# catkin_make
# source devel/setup.bash
# rosrun kinect_bridge kinect_bridge
# rosrun kinect_viewer kinect_viewer


# Install Nix: https://nixos.org/nix/download.html
# bash <(curl -L https://nixos.org/nix/install)
#
# nix-channel --add https://github.com/guibou/nixGL/archive/master.tar.gz nixgl && nix-channel --update
# nix-env -iA nixgl.nixGLDefault   # or replace `nixGLDefault` with your desired wrapper
#
# (Optional) configure Nix to use ROS Cachix binary cache
# nix-env -iA cachix -f https://cachix.org/api/v1/install
# cachix use ros
#
# git clone --recurse-submodules https://github.com/carlos-cardoso/nix-ros-overlay.git
#
# Copy udev rules
# sudo cp 90-kinect2.rules /etc/udev/rules.d/

# sh load_kinnect_shell.sh
# cd catkin_ws
# catkin_make
# source devel/setup.sh
# catkin_make

# to run, in different terminals
# roscore
# nixGL rosrun kinect2_bridge kinect2_bridge
# nixGL rosrun kinect2_viewer kinect2_viewer
