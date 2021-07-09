{ pkgs ? import (fetchTarball https://git.io/Jf0cc) {}}:

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
pkgs.stdenv.mkDerivation rec {
     pname = "libfreenect2";
     version = "2.0";

     src = pkgs.fetchFromGitHub {
       owner = "OpenKinect";
       repo = "libfreenect2";
       rev = "fd64c5d9b214df6f6a55b4419357e51083f15d93";
       sha256 = "159f50kyphag82fvkqph4fd9w90mls8mc82rmyq06kab3y4m1qxz";
     };

    outputs = [ "out" "dev" ]; # get rid of propagating systemd closure

    buildInputs = [
                pkgs.libva
                #pkgs.cudatoolkit_11_2
                pkgs.libjpeg_turbo
                pkgs.glfw3
                pkgs.opencv4
                libusb_1_0_20
                pkgs.freeglut
                pkgs.libGLU
                pkgs.libGL
                pkgs.glibcLocales
                pkgs.libogg
                pkgs.libtheora
                pkgs.libusb1
                pkgs.cmake
                pkgs.pkg-config
                ]  ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [ pkgs.GLUT pkgs.Cocoa ];

}
