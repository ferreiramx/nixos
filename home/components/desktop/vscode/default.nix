{ config, pkgs, vars, ... }:
let
  vscodeThemeFromScheme = import ./vscode-theme.nix { inherit pkgs; };
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    userSettings = {
      "window.zoomLevel" = if (vars.screen.hidpi) then 1 else 0;
      "editor.fontSize" = vars.fonts.mono;
      "editor.fontFamily" = "SauceCodePro Nerd Font";
      "workbench.fontSize" = vars.fonts.sans;
      "workbench.fontFamily" = "SauceCodePro Nerd Font";
      "terminal.integrated.fontSize" = vars.fonts.mono;
      "terminal.integrated.fontFamily" = "SauceCodePro Nerd Font";
      "editor.minimap.enabled" = false;
      "editor.bracketPairColorization.enabled" = false;
      "sqltools.highlightQuery" = false;
      "git.openRepositoryInParentFolders" = "never";
      "workbench.colorTheme" = "nix-colors-${config.colorScheme.slug}";
      "extensions.autoUpdate" = false;
      "remote.SSH.useLocalServer" = false;
      "remote.SSH.remotePlatform" = {
        "10.0.0.19" = "linux";
        "streamlit" = "linux";
        "metabase" = "linux";
        "airbyte" = "linux";
        "cube" = "linux";
        "cube-dev" = "linux";
      };
    };
    extensions = with pkgs.vscode-extensions;
      [
        (vscodeThemeFromScheme { scheme = config.colorScheme; })
        bbenoist.nix
        ms-python.python
        arcticicestudio.nord-visual-studio-code
        ms-toolsai.jupyter
        ms-toolsai.jupyter-renderers
        jnoortheen.nix-ide
        ms-vscode-remote.remote-ssh
        bungcip.better-toml
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
        ];
  };
}
