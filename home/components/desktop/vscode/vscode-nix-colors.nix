# TODO: Rename output theme to coloscheme slug
# TODO: Split script into build phase and install phase
{ config, pkgs, lib, stdenv }:
let
  theme = import ./theme.nix { inherit config; };
in
with lib;
stdenv.mkDerivation {
  name = "vscode-nix-colors";
  version = "1.0.0";
  src = ./nix-colors;

  buildInputs = with pkgs; [ vscode vsce nodePackages.npm ];

  installPhase = ''
    export HOME=$(pwd)
    install -Dm 0744 $src/LICENSE $out/LICENSE
    install -Dm 0745 $src/install.sh $out/install.sh
    install -Dm 0744 $src/package.json $out/package.json
    echo '${theme}' > $out/nix-colors.json
    cd $out
    vsce package --allow-missing-repository -o $out/vscode-nix-colors.zip
    '';
}
