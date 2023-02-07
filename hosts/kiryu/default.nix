# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, lib, config, pkgs, ... }: {
  imports =
    [
      ./hardware-configuration.nix

      ../common/optional/bluetooth.nix
      ../common/optional/graphics/nvidia
      ../common/optional/hardware/touchpad
      ../common/optional/desktop/dm/gdm
      ../common/optional/desktop/wm/qtile

      ../common/global
    ];

  networking.hostName = "kiryu";
  time.timeZone = "America/Mexico_City";
  i18n.defaultLocale = "en_US.utf8";

  services.xserver.layout = "us";
  services.xserver.xkbVariant = "";

  # Users
  users.users.aferreira = {
    isNormalUser = true;
    description = "Angel Ferreira";
    extraGroups = [ "wheel" "networkmanager" ];
  };
  services.getty.autologinUser = "aferreira";

  # Packages
  fonts.fonts = with pkgs;[
    source-code-pro
    source-sans-pro
    (nerdfonts.override { fonts = [ "SourceCodePro" ]; })
    font-awesome
    material-design-icons
  ];
  environment.systemPackages = with pkgs; [
    # CLI Tools
    wget
    nixpkgs-fmt
    gotop
    rsync
    bitwarden-cli
    appimage-run
    binutils
    openssl
    snowsql

    # Coding
    insomnia

    # Desktop
    scrot
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    i3lock-color
    libreoffice-fresh
    viewnior

    # Web
    vivaldi
    vivaldi-ffmpeg-codecs
    vivaldi-widevine
    firefox
    discord
    betterdiscord-installer
    qbittorrent
    slack
    whatsapp-for-linux
    zoom-us

    # Media
    spotify
    spicetify-cli
    gimp
    obs-studio
    pamixer
    pavucontrol
    playerctl
    vlc

    # System
    lm_sensors
    hddtemp
    hdparm
    smartmontools
    arandr
    bluez
    bluez-tools
    gparted
    logiops
    ntfs3g
    openrgb
    qemu_full
    virt-manager
    radeontop
    wine
    polkit_gnome

    # Games
    runelite
    lutris
    mgba
    (retroarch.override {
      cores = [
        libretro.mgba
        libretro.pcsx2
        libretro.snes9x
        libretro.citra
        libretro.dosbox
        libretro.sameboy
        libretro.dolphin
        libretro.desmume
        libretro.nestopia
        libretro.pcsx-rearmed
        libretro.parallel-n64
      ];
    })
  ];
  programs.file-roller.enable = true;
  programs.steam.enable = true;
  programs.vim.defaultEditor = true;
  programs.dconf.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Services
  services.openssh.enable = true;
  services.blueman.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  # services.syncthing = {
  #   enable = true;
  #   user = "aferreira";

  # };

  services.tlp.enable = false;

  services.openvpn.servers = {
    boletia = {
      config = '' config /root/nixos/openvpn/boletia.conf'';
      autoStart = true;
    };
  };

  # Systemd
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wants = [ "graphical-session.target" ];
      wantedBy = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  nixpkgs.overlays = [
    (
      self: super: {
        qtile = super.qtile.unwrapped.override (old: {
          propagatedBuildInputs = (old.propagatedBuildInputs or [ ]) ++ (with self.python3Packages; [
            dbus-next
          ]);
        });
      }
    )
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?
}
