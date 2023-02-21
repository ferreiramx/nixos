{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    spotify
    spicetify-cli
    obs-studio
    vlc
    gimp
  ];
}
