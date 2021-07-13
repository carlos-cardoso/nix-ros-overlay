# Run:
# roslaunch turtlebot3_gazebo turtlebot3_world.launch
# roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch

with import ../. {};
with rosPackages.noetic;
with pythonPackages;


let
   libusb_1_0_20 = pkgs.stdenv.mkDerivation rec {
     name = "libusb-1.0.20";

     src = pkgs.fetchurl {
       url = "mirror://sourceforge/libusb/${name}.tar.bz2";
       sha256 = "1zzp6hc7r7m3gl6zjbmzn92zkih4664cckaf49l1g5hapa8721fb";
     };

     outputs = [ "out" "dev" ]; # get rid of propagating systemd closure

     buildInputs = [ pkgs.pkgconfig ];
     propagatedBuildInputs =
       pkgs.lib.optional pkgs.stdenv.isLinux pkgs.systemd ++
       pkgs.lib.optionals pkgs.stdenv.isDarwin [ pkgs.libobjc pkgs.IOKit ];

     NIX_LDFLAGS = pkgs.lib.optionalString pkgs.stdenv.isLinux "-lgcc_s";

     preFixup = pkgs.lib.optionalString pkgs.stdenv.isLinux ''
     sed 's,-ludev,-L${pkgs.systemd}/lib -ludev,' -i $out/lib/libusb-1.0.la
     '';
};
in

mkShell {
  buildInputs = [
    pkgs.bashInteractive
    pkgs.libva
    #pkgs.cudatoolkit_11_2
    pkgs.libjpeg_turbo
    pkgs.glfw3
    pkgs.opencv4
    libusb_1_0_20
    pkgs.freeglut
    pkgs.libGLU
    pkgs.libGL
    glibcLocales
    libogg
    libtheora
    libusb1
    (buildEnv { paths = [
      rosbash
      perception-pcl
      libfreenect2
      cv-bridge
      image-transport-plugins
    ]; })
  ]  ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [ pkgs.GLUT pkgs.Cocoa ];

  nativeBuildInputs = [ pkgs.cmake pkgs.pkg-config  ];

  ROS_HOSTNAME = "localhost";
  ROS_MASTER_URI = "http://localhost:11311";

  shellHook = ''
    source "./catkin_ws/devel/setup.bash"
  '';
}
