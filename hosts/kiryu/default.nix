{ inputs, pkgs, ... }: {
  imports =
    [
      # Hardware
      inputs.nixos-hardware.nixosModules.asus-zephyrus-ga401
      ./hardware-configuration.nix
      ./asus.nix
      ./keybinds.nix

      # Global Settings
      ../common/global

      # Optional settings enabled on this machine
      ../common/optional/audio
      ../common/optional/bluetooth
      ../common/optional/desktop
      ../common/optional/desktop/office
      ../common/optional/desktop/media
      ../common/optional/desktop/web
      ../common/optional/desktop/wm/qtile
      ../common/optional/desktop/dm/gdm
      ../common/optional/desktop/wm/hyprland
      ../common/optional/filesystem
      ../common/optional/games/runelite.nix
      ../common/optional/games/lutris.nix
      ../common/optional/graphics/nvidia
      ../common/optional/hardware/logitech
      ../common/optional/hardware/monitoring
      ../common/optional/hardware/laptop
      # ../common/optional/network
      ../common/optional/virt
      ../common/optional/work

      # Users for this machine
      ../common/users/aferreira

      inputs.hyprland.nixosModules.default

    ];

  networking.hostName = "kiryu";
  time.timeZone = "America/Mexico_City";
  i18n.defaultLocale = "en_US.utf8";

  services.xserver = {
    layout = "us";
    xkbVariant = "";
    displayManager.defaultSession = "hyprland";
  };

  services.tlp.enable = false;

  services.getty.autologinUser = "aferreira";

  programs.hyprland.nvidiaPatches = true;
  programs.hyprland.xwayland.hidpi = true;
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };

  home-manager.extraSpecialArgs = {
    vars = {
      hostName = "kiryu";
      class = "laptop";
      screen = {
        name = "eDP-1";
        ultrawide = false;
        hidpi = true;
        width = 2560;
        height = 1440;
        refresh = 120;
      };
      fonts = {
        sans = 18;
        mono = 18;
        dunst = 14;
        small-icon = 20;
        large-icon = 28;
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
