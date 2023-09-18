{ stdenv, pkgs, fetchFromGitHub }:

stdenv.mkDerivation {
  name = "ha-dyson";
  src = fetchFromGitHub {
    owner = "shenxn";
    repo = "ha-dyson";
    rev = "c38a7dd84cfac76fe540d78088c5bf8b34e0c7d8";
    sha256 = "HLY8+eXzfVasO1EVZQ46mooJ4beID01RvYo4BfjHfnc=";
  };

  
  installPhase = ''cp -a custom_components/dyson_local $out'';
}