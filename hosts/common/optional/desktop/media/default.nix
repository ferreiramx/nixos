{ inputs, lib, config, pkgs, ... }: {
  imports = [ ];
  environment.systemPackages = with pkgs; [
    spotify
    spicetify-cli
    obs-studio
    vlc
    gimp
  ];
}
