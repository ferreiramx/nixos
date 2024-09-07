{ stdenv, pkgs, fetchFromGitHub }:

stdenv.mkDerivation {
  name = "home-assistant-iocare";
  src = fetchFromGitHub {
    owner = "RobertD502";
    repo = "home-assistant-iocare";
    rev = "13b6e1c9df82853603303753687e1db2f4988595";
    sha256 = "fO+i5bpgMd2t2IJkt5DwexYD5Vm2T0sKmTakI4+6wKQ=";
  };

  
  installPhase = ''cp -a custom_components/coway $out'';
}