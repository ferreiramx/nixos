# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, pkgs, ... }: {
  imports =
    [
      inputs.nixos-hardware.nixosModules.asus-zephyrus-ga401
      ./hardware-configuration.nix

      ../common/global

      ../common/optional/audio
      ../common/optional/bluetooth
      ../common/optional/desktop
      ../common/optional/desktop/office
      ../common/optional/desktop/media
      ../common/optional/desktop/web
      ../common/optional/desktop/dm/lightdm
      ../common/optional/desktop/wm/qtile
      ../common/optional/filesystem
      ../common/optional/games/runelite.nix
      ../common/optional/graphics/nvidia
      ../common/optional/hardware/logitech
      ../common/optional/hardware/monitoring
      ../common/optional/hardware/touchpad

      # ../common/optional/network
      ../common/optional/virt
      ../common/optional/work

      ../common/users/aferreira

    ];

  networking.hostName = "kiryu";
  time.timeZone = "America/Mexico_City";
  i18n.defaultLocale = "en_US.utf8";

  services.xserver = {
    layout = "us";
    xkbVariant = "";
    displayManager.defaultSession = "none+qtile";
  };

  services.tlp.enable = false;

  services.getty.autologinUser = "aferreira";

  home-manager.extraSpecialArgs = {
    vars = {
      class = "laptop";
      screen = {
        name = "eDP";
        width = 2560;
        height = 1440;
        refresh = 120;
      };
      fonts = {
        dunst = 14;
        sans = 18;
        mono = 18;
        small-icon = 20;
        large-icon = 29;
        os-icon = 25;
      };
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?
}
