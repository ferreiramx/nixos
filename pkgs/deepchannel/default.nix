{ pkgs }:
with pkgs;
appimageTools.wrapType2 rec {
  name = "deepchannel";

  src = fetchurl {
    url = "https://downloads.deepchannel.com/packaged/release/Deep%20Channel-3.14.1.AppImage";
    sha256 = "eN1nNQFjy8EDyDGiORzdBbuDi3PvGJx6ERBHZ3fYeko=";
  };

  extraPkgs = pkgs: with pkgs; [ ];
}