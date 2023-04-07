{ pkgs }:
with pkgs;
appimageTools.wrapType2 rec {
  name = "deepchannel";

  src = fetchurl {
    url = "https://downloads.deepchannel.com/packaged/release/Deep%20Channel-3.11.0.AppImage";
    sha256 = "0zpbrzr2v2z3aa097x2d86r1hk9pra253wcfnk6jaa58wgw4arjb";
  };

  extraPkgs = pkgs: with pkgs; [ ];
}