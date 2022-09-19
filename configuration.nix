# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Polkit
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
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Mexico_City";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    layout = "latam";
    xkbVariant = "";
  };
 services.xserver.windowManager.qtile.enable = true;
 services.xserver.displayManager.sddm.enable = true;
  # Configure console keymap
  console.keyMap = "la-latin1";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.aferreira = {
    isNormalUser = true;
    description = "Angel Ferreira";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "aferreira";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   vim
   wget
   vscodium
   kitty
   dunst
   rofi
   vivaldi
   vivaldi-ffmpeg-codecs
   vivaldi-widevine
   eww
   scrot
   spotify
   spicetify-cli
   lxappearance
   xfce.thunar
   xfce.thunar-volman
   xfce.thunar-archive-plugin
   lm_sensors
   picom
   runelite
   polkit_gnome
   (vscode-with-extensions.override {
    vscode = vscode;
    vscodeExtensions = with vscode-extensions; 
    [
      ms-python.python
      arcticicestudio.nord-visual-studio-code
      ms-toolsai.jupyter
      ms-toolsai.jupyter-renderers
      jnoortheen.nix-ide
    ] 
      
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace
    [
      {
        name = "yuck";
        publisher = "eww-yuck";
        version = "0.0.3";
        sha256 = "DITgLedaO0Ifrttu+ZXkiaVA7Ua5RXc4jXQHPYLqrcM=";
      }
      {
        name = "prettier-sql-vscode";
        publisher = "inferrinizzard";
        version = "1.3.1";
        sha256 = "YDpkL0HQfsyH4TVmaWMwJh6NMiCIRBMBOKKhnLcerno=";
      }
      {
        name = "inline-sql-syntax";
        publisher = "qufiwefefwoyn";
        version = "2.15.0";
        sha256 = "LtEM9MrEzBErPtPD4InKempHeexO1MtwdeyQ6ufyFkE=";
      }
      {
        name = "sqltools";
        publisher = "mtxr";
        version = "0.25.1";
        sha256 = "qi/OhJi38It8DEcRrYjjjsDJRtZNnJrqU55qwAFqXP0=";
      }
      {
        name = "snowflake-driver-for-sqltools";
        publisher = "koszti";
        version = "0.4.2";
        sha256 = "dLKnurvYn3impla9Vlw/RcehYJDC5ylRDnHvRs1rh/I=";
      }
      {
        name = "snowflake-vscode";
        publisher = "okeeffdp";
        version = "0.0.1";
        sha256 = "W3oWrJ9U/cPSSGU/I+eDIzkylesbnuKTK+6iVXbkW2s=";
      }
    ];
    })
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
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
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
