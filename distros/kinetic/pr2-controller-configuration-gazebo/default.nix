
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo, pr2-controller-manager, pr2-gripper-action, pr2-head-action, single-joint-position-action }:
buildRosPackage {
  pname = "ros-kinetic-pr2-controller-configuration-gazebo";
  version = "2.0.11";

  src = fetchurl {
    url = "https://github.com/pr2-gbp/pr2_simulator-release/archive/release/kinetic/pr2_controller_configuration_gazebo/2.0.11-0.tar.gz";
    name = "2.0.11-0.tar.gz";
    sha256 = "91c14804efe06595ffb5a60a02c3c77d317ff63e598f6407cfed9491b3c38b45";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ gazebo pr2-controller-manager pr2-gripper-action pr2-head-action single-joint-position-action ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A copy of the pr2_controller_configuration package, for use in 
    the PR2 simulator.  We maintain two copies to allow for controller
    gains to be set differently between hardware and simulation.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
