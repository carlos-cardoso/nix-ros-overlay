
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, rcpputils, ament-lint-common, launch-testing, class-loader, composition-interfaces, ament-cmake-gtest, rclcpp, ament-index-cpp, ament-cmake-ros, std-msgs, ament-lint-auto }:
buildRosPackage {
  pname = "ros-dashing-rclcpp-components";
  version = "0.7.10-r1";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/rclcpp-release/archive/release/dashing/rclcpp_components/0.7.10-1.tar.gz";
    name = "0.7.10-1.tar.gz";
    sha256 = "9e9b541e77a0f1200af78f97fc4b8524ce0fff3dc973a0b0b26dc1bd48813ed1";
  };

  buildType = "ament_cmake";
  buildInputs = [ rcpputils class-loader composition-interfaces rclcpp ament-index-cpp ];
  checkInputs = [ ament-lint-common launch-testing ament-cmake-gtest std-msgs ament-lint-auto ];
  propagatedBuildInputs = [ class-loader composition-interfaces rclcpp ament-index-cpp ];
  nativeBuildInputs = [ ament-cmake-ros ];

  meta = {
    description = ''Package containing tools for dynamically loadable components'';
    license = with lib.licenses; [ asl20 ];
  };
}