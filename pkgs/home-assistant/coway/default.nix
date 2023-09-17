{ stdenv, pkgs, fetchFromGitHub }:

stdenv.mkDerivation {
  name = "home-assistant-iocare";
  src = fetchFromGitHub {
    owner = "RobertD502";
    repo = "home-assistant-iocare";
    rev = "89c2c0d19aff6042b92a908cc9e4f123645afbf5";
    sha256 = "VkfBsdnU+ywn8Nqv7H09BFSN88KHrDScYJ/v6j3X09E=";
  };

  
  installPhase = ''cp -a custom_components/coway $out'';
}