# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, lib, config, pkgs, ... }:
let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
in
{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # Security
  security.polkit.enable = true;
  security.sudo.wheelNeedsPassword = false;
  security.polkit.extraConfig = ''
    /* Allow members of the wheel group to execute any actions
    * without password authentication, similar to "sudo NOPASSWD:"
    */
    polkit.addRule(function(action, subject) {
        if (subject.isInGroup("wheel")) {
            return polkit.Result.YES;
        }
    });
  '';
  virtualisation.virtualbox.host.enable = true;
   users.extraGroups.vboxusers.members = [ "aferreira" ];
   virtualisation.virtualbox.host.enableExtensionPack = true;

  # Networking
  networking.hostName = "kiryu"; # Define your hostname.
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;
  
  # Bluetooth
  hardware.bluetooth.enable = true;

  # Graphics
  hardware.opengl.enable = true;
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.latest;
    modesetting.enable = true;
    prime = {
      offload.enable = true;
      nvidiaBusId = "PCI:1:0:0";
      amdgpuBusId = "PCI:4:0:0";
    };
  };
  time.timeZone = "America/Mexico_City";
  i18n.defaultLocale = "en_US.utf8";

  # X11
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    libinput = {
      enable = true;
      touchpad = {
        accelProfile = "adaptive";
      };
    };
    windowManager.qtile.enable = true;
    displayManager.gdm.enable = true;
    videoDrivers = [ "nvidia" ];
  };

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
    neofetch
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
    nvidia-offload
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

  nix = {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };

    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?
}
