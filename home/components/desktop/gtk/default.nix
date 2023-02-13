{ pkgs, ... }: {
  gtk = {
    enable = true;
    theme = {
      package = (pkgs.graphite-gtk-theme.override { tweaks = [ "black" ]; });
      name = "Graphite-Dark";
    };
    cursorTheme = {
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-cursors";
    };
    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-black-dark";
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
  home.sessionVariables.GTK_THEME = "Graphite-Dark";
}
