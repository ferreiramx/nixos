{ config, pkgs, vars, ... }:
let
  vscode-nix-colors = pkgs.callPackage ./vscode-nix-colors.nix { inherit config pkgs; };
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    userSettings = {
      "window.zoomLevel" = if (vars.screen.hidpi) then 1 else 0;
      "editor.fontSize" = vars.fonts.mono;
      "editor.fontFamily" = "SauceCodePro Nerd Font";
      "editor.fontWeight" = "Semibold";
      "workbench.colorTheme" = "nix-colors";
      "workbench.fontSize" = vars.fonts.sans;
      "workbench.fontFamily" = "Source Sans Pro";
      "terminal.integrated.fontSize" = vars.fonts.mono;
      "terminal.integrated.fontFamily" = "SauceCodePro Nerd Font";
      "terminal.integrated.fontWeight" = "Semibold";
      "editor.minimap.enabled" = false;
      "editor.bracketPairColorization.enabled" = false;
    };
    extensions = with pkgs.vscode-extensions;
      [
        ms-python.python
        arcticicestudio.nord-visual-studio-code
        ms-toolsai.jupyter
        ms-toolsai.jupyter-renderers
        jnoortheen.nix-ide
        ms-vscode-remote.remote-ssh
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace
        [
          {
            name = "prettier-sql-vscode";
            publisher = "inferrinizzard";
            version = "1.3.1";
            sha256 = "YDpkL0HQfsyH4TVmaWMwJh6NMiCIRBMBOKKhnLcerno=";
          }
          {
            name = "inline-sql-syntax";
            publisher = "qufiwefefwoyn";
            version = "2.15.0";
            sha256 = "LtEM9MrEzBErPtPD4InKempHeexO1MtwdeyQ6ufyFkE=";
          }
          {
            name = "sqltools";
            publisher = "mtxr";
            version = "0.25.1";
            sha256 = "qi/OhJi38It8DEcRrYjjjsDJRtZNnJrqU55qwAFqXP0=";
          }
          {
            name = "snowflake-driver-for-sqltools";
            publisher = "koszti";
            version = "0.4.2";
            sha256 = "dLKnurvYn3impla9Vlw/RcehYJDC5ylRDnHvRs1rh/I=";
          }
          {
            name = "snowflake-vscode";
            publisher = "okeeffdp";
            version = "0.0.1";
            sha256 = "W3oWrJ9U/cPSSGU/I+eDIzkylesbnuKTK+6iVXbkW2s=";
          }
          {
            name = "mostly-black";
            publisher = "vberlier";
            version = "1.3.0";
            sha256 = "FGKDEPKSbyYZ5wef5Iip7oOuQFhPD/kNMtuKNefuz+8=";
          }
          {
            name = "vscode-yaml";
            publisher = "redhat";
            version = "1.12.2";
            sha256 = "EjHQvWiEEfLxM+c/SWAJ2H9ltGEgzMSC84Zyl5u+eqQ=";
          }
        ]
      ++ [
        (pkgs.vscode-utils.buildVscodeExtension
          {
            name = vscode-nix-colors.name;
            vscodeExtName = vscode-nix-colors.name;
            src = "${vscode-nix-colors}/${vscode-nix-colors.name}.zip";
            vscodeExtUniqueId = "aferreira.vscode-nix-colors";
            vscodeExtPublisher = "aferreira";
            version = "1.0.0";
          })
      ];
  };
}
