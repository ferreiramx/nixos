# TODO: Config Discord
{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    discord
    betterdiscord-installer
  ];
}
