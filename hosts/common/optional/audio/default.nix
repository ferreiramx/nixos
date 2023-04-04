{ pkgs, ... }: {
  imports = [
    ./pipewire.nix
  ];

  environment.systemPackages = with pkgs; [
    pamixer
    pavucontrol
    playerctl
    pulseaudio
  ];
}
