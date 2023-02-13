{pkgs, ...}: {
  services.xserver = {
    displayManager.lightdm = {
      enable = true;
      greeters.gtk = {
        enable = true;
        theme = {
          name = "Graphite-Dark";
          package = pkgs.graphite-gtk-theme;
        };
        extraConfig = ''
          background=/home/aferreira/.wp
          enable-hidpi=auto
        '';
      };
    };
  };
}