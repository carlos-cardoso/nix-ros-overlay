
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, catkin, gazebo-ros, gazebo-ros-control, prbt-moveit-config, prbt-support, roscpp, roslaunch, rostest, trajectory-msgs, xacro }:
buildRosPackage {
  pname = "ros-melodic-prbt-gazebo";
  version = "0.5.18-r1";

  src = fetchurl {
    url = "https://github.com/PilzDE/pilz_robots-release/archive/release/melodic/prbt_gazebo/0.5.18-1.tar.gz";
    name = "0.5.18-1.tar.gz";
    sha256 = "7211d0c2a93cafcb0024651565ebd80a587c0734bd6fa6c23a2ef8602a9b4596";
  };

  buildType = "catkin";
  checkInputs = [ actionlib roscpp rostest trajectory-msgs ];
  propagatedBuildInputs = [ gazebo-ros gazebo-ros-control prbt-moveit-config prbt-support roslaunch xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Launch prbt robot in an empty Gazebo world.'';
    license = with lib.licenses; [ asl20 ];
  };
}
