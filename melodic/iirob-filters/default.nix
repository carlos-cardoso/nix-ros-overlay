
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, filters, pluginlib, cmake-modules, catkin, tf2-ros, roscpp, rostest, dynamic-reconfigure, eigen-conversions, rosparam-handler, geometry-msgs }:
buildRosPackage {
  pname = "ros-melodic-iirob-filters";
  version = "0.8.1-r2";

  src = fetchurl {
    url = "https://github.com/KITrobotics/iirob_filters-release/archive/release/melodic/iirob_filters/0.8.1-2.tar.gz";
    name = "0.8.1-2.tar.gz";
    sha256 = "6629c570ce81b0181753951b2c3376bfe2c81ba9d8819f32380e8a5e668c3494";
  };

  buildType = "catkin";
  buildInputs = [ filters cmake-modules pluginlib roscpp tf2-ros rostest dynamic-reconfigure eigen-conversions rosparam-handler geometry-msgs ];
  propagatedBuildInputs = [ filters cmake-modules pluginlib rosparam-handler tf2-ros rostest dynamic-reconfigure eigen-conversions roscpp geometry-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The iirob_filters package implements following filters:
      1) Low-Pass
      2) Moving Mean
      3) Gravity Compensation (used for force-torque sensors)
      4) Threshold Filter
      5) Kalman Filter'';
    license = with lib.licenses; [ lgpl2 ];
  };
}