{ config, pkgs, lib }:
let
  theme = import ./theme.nix {inherit config;}; 
in
with lib;
# Define the package
pkgs.stdenv.mkDerivation {
  name = "vscode-nix-colors";
  version = "1.0.0";
  src = ./nix-colors;

  buildInputs = with pkgs; [ vscode vscode.vsce nodePackages.npm ];
  buildCommand = ''
    mkdir -p $out
    echo ${theme} > $out/nix-colors.json
    cd $src
    $buildInputs/vsce package --allow-missing-repository -o $out/vscode-nix-colors.vsix
  '';

  installPhase = ''
    ${pkgs.vscode}/bin/code --install-extension $out/vscode-nix-colors.vsix
  '';
}
