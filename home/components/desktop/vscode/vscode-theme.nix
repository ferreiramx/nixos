{ pkgs }:
{ scheme }:
let
  theme = builtins.toJSON (import ./vscode-theme/theme.nix { inherit scheme; });
  package-json = builtins.toJSON (import ./vscode-theme/package-json.nix { inherit scheme; });
  vsix = pkgs.stdenv.mkDerivation rec {
    name = "generated-vscode-theme-${scheme.slug}";
    version = "1.0.0";
    src = ./vscode-theme;

    buildInputs = with pkgs; [ vscode vsce nodePackages.npm ];

    buildPhase = ''
      export HOME=$(pwd)
      install -Dm 0744 $src/LICENSE $out/LICENSE
      echo '${package-json}' > $out/package.json
      echo '${theme}' > $out/nix-colors.json
    '';

    installPhase = ''
      export HOME=$(pwd)
      cd $out
      vsce package --allow-missing-repository -o $out/${name}.zip
    '';
  };
in
pkgs.vscode-utils.buildVscodeExtension {
  name = vsix.name;
  vscodeExtName = vsix.name;
  src = "${vsix}/${vsix.name}.zip";
  vscodeExtUniqueId = "nix-colors.${vsix.name}";
  vscodeExtPublisher = "nix-colors";
  version = "1.0.0";
}
