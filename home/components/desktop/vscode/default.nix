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
      "[sql]" = {
      "editor.defaultFormatter" = "innoverio.vscode-dbt-power-user";
      };
      "diffEditor.codeLens" = true;
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
         tamasfe.even-better-toml
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
            version = "2.16.0";
            sha256 = "QAbYWwA6xlRfyqA/JBEUlxVt9q7RGbm0bLBkb4szYcA=";
          }
          {
            name = "sqltools";
            publisher = "mtxr";
            version = "0.28.1";
            sha256 = "PzDbH9pYeIzmMFOkPMsbo5pNGXI6qusaAlwM6sk9s10=";
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
            name = "vscode-dbt-power-user";
            publisher = "innoverio";
            version = "0.28.4";
            sha256 = "oZ2lCzu6rfIJeDeoOEn4lFNarfJRK9HEaDR6mfZcpx4=";
          }
          {
            name = "jinjahtml";
            publisher = "samuelcolvin";
            version = "0.20.0";
            sha256 = "wADL3AkLfT2N9io8h6XYgceKyltJCz5ZHZhB14ipqpM=";
          }
          {
            name = "vscode-dbt-formatter";
            publisher = "henriblancke";
            version = "1.0.1";
            sha256 = "1twAeJkkJkPoWx/0KnKm//YcYgbuNVLVxQKH8HwwmHE=";
          }
          {
            name = "vscode-dbt";
            publisher = "bastienboutonnet";
            version = "0.5.1";
            sha256 = "tXl9n6zRtHybUkpuPBnkko6S4tO2oT0SYomqCS3ODAE=";
          }
          {
            name = "geminicodeassist";
            publisher = "google";
            version = "2.28.1";
            sha256 = "2uaYp6mbLG8qdlqxIqcNq78DXb9aLyB6MW5oVNLVqsU=";
          }
        ];
  };
}
