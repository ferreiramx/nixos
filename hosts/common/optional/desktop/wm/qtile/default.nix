{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ../../x11
  ];
  services.xserver.windowManager.qtile.enable = true;
  
  environment.systemPackages = with pkgs; [
    i3lock-color
  ];
}
