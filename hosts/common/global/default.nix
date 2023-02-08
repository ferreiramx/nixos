{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./bootloader.nix
    ./system.nix
    ./networkmanager.nix
    ./openssh.nix
  ];
  programs.vim.defaultEditor = true;
  environment.systemPackages = with pkgs; [
    rsync
    nixpkgs-fmt
    bitwarden-cli
  ];

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };

    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
  };
}
