# TODO: Set proper AMD graphics config
{ inputs, pkgs, ... }: {
  imports =
    [
      # Hardware
      ./hardware-configuration.nix

      # Global Settings
      ../common/global

      # Optional settings enabled on this machine
      ../common/optional/audio
      ../common/optional/bluetooth
      ../common/optional/desktop
      ../common/optional/desktop/office
      ../common/optional/desktop/media
      ../common/optional/desktop/web
      ../common/optional/desktop/dm/gdm
      ../common/optional/desktop/wm/hyprland
      ../common/optional/filesystem
      ../common/optional/games
      ../common/optional/graphics/amd
      ../common/optional/hardware/logitech
      ../common/optional/hardware/corsair
      ../common/optional/hardware/monitoring
      ../common/optional/hardware/printer
      ../common/optional/network/hosts.nix
      ../common/optional/virt
      ../common/optional/work

      # Users for this machine
      ../common/users/aferreira
    ];

  networking.hostName = "mugendramon";
  time.timeZone = "America/Mexico_City";
  i18n.defaultLocale = "en_US.utf8";
  services.displayManager.defaultSession = "hyprland";
  services.xserver = {
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # services.getty.autologinUser = "aferreira";

  home-manager.extraSpecialArgs = {
    vars = {
      hostName = "mugendramon";
      class = "desktop";
      screen = {
        name = "DP-2";
        ultrawide = true;
        hidpi = false;
        width = 3840;
        height = 1080;
        refresh = 144;
      };
      fonts = {
        sans = 13;
        mono = 13;
        dunst = 12;
        small-icon = 15;
        large-icon = 20;
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
  system.stateVersion = "23.05"; # Did you read the comment?
}
