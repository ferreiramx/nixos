{ 
  lib, 
  stdenv,
  fetchFromGitHub
}:

with lib;

# Define the package
pkgs.stdenv.mkDerivation rec {
  # The name of the package
  name = "vscode-nix-colors";

  # The version of the package
  version = "1.0.0";

  # The source of the package, in this case a GitHub repository
  src = pkgs.fetchFromGitHub {
    owner = "ferreiramx";
    repo = "vscode-nix-colors";
    rev = "master"; # or a specific commit hash, branch, or tag
    sha256 = "0000000000000000000000000000000000000000000000000000"; # SHA256 of the source archive, can be left empty for GitHub sources
  };

  # Set up the build environment
  buildInputs = with pkgs; [ vscode vscode.vsce nodePackages.npm ];

  # The build command, which runs `vsce package` to build the extension
  buildCommand = ''
    mkdir -p $out
    cd $src
    $buildInputs/vsce package --allow-missing-repository -o $out/vscode-nix-colors.vsix
  '';

  # The install command, which installs the built extension into the user's VSCode
  installPhase = ''
    ${pkgs.vscode}/bin/code --install-extension $out/vscode-nix-colors.vsix
  '';
}
