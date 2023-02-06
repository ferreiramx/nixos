{ inputs, lib, config, pkgs, ... }: {
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-cursors";
    };
    iconTheme = {
      package = pkgs.nordzy-icon-theme;
      name = "Nordzy-dark";
    };
  };
}
