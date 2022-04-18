
{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/30d3d79b7d3607d56546dd2a6b49e156ba0ec634.tar.gz") {}}:

let
  # get a normalized set of packages, from which
  # we will install all the needed dependencies
in
pkgs.mkShell {
    buildInputs = [
        pkgs.jdk
        pkgs.gradle
    ];

  shellHook = ''
    echo "setup java gradle dev environment"
    export GRADLE_USER_HOME="$PWD/.gradle_user_root"
  '';
}
