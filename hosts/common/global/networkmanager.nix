# TODO: Declarative home wifi settings
{ ... }: {
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;
}
