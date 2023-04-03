{ inputs, pkgs, ... }: {
  imports =
    [
      # Hardware
      ./hardware-configuration.nix

      # Global Settings
      ../common/global

      # Users for this machine
      ../common/users/aferreira
    ];

  networking.hostName = "nixos";
  time.timeZone = "America/Mexico_City";
  i18n.defaultLocale = "en_US.utf8";


  services.getty.autologinUser = "aferreira";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?
}
