{ stdenv, pkgs, fetchFromGitHub }:

stdenv.mkDerivation {
  name = "ha-dyson=cloud";
  src = fetchFromGitHub {
    owner = "shenxn";
    repo = "ha-dyson-cloud";
    rev = "3a35374e821b0c755b3656e54f5e87a648bc62c1";
    sha256 = "u1hSjY8QLqUWzsucUSCfUJzWh0HtYB6bpGCVG+8z++8=";
  };

  
  installPhase = ''cp -a custom_components/dyson_cloud $out'';
}