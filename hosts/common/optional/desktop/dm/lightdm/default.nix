{
  services.xserver = {
    displayManager.lightdm = {
      enable = true;
      greeters.gtk = {
        enable = true;
        extraConfig = ''
          background=/home/aferreira/.wp
          enable-hidpi=auto
        '';
      };
    };
  };
}