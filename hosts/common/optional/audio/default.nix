{ inputs, lib, config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    pamixer
    pavucontrol
    playerctl
  ];
}
