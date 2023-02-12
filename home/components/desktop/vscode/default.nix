{ inputs, lib, config, pkgs, ... }: {
  # VSCode 
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    userSettings = {
      "window.zoomLevel" = 1;
      "editor.fontSize" = 18;
      "editor.fontFamily" = "SauceCodePro Nerd Font";
      "editor.fontWeight" = "Semibold";
      "workbench.colorTheme" = "Default Dark+ Experimental";
      "workbench.fontSize" = 18;
      "workbench.fontFamily" = "Source Sans Pro";
      "terminal.integrated.fontSize" = 18;
      "terminal.integrated.fontFamily" = "SauceCodePro Nerd Font";
      "terminal.integrated.fontWeight" = "Semibold";
    };
    extensions = with pkgs.vscode-extensions;
      [
        ms-python.python
        arcticicestudio.nord-visual-studio-code
        ms-toolsai.jupyter
        ms-toolsai.jupyter-renderers
        jnoortheen.nix-ide
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
  # Custom theme
  xdg.configFile."VSCodium" = {
    source = ./themes;
    recursive = true;
  };

}