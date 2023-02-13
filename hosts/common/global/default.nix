{ inputs, lib, pkgs, outputs, ... }: {
  imports = [
    ./bootloader.nix
    ./system.nix
    ./networkmanager.nix
    ./openssh.nix
    ./locale.nix
    ./nix.nix
    ./fish.nix
    inputs.home-manager.nixosModules.home-manager
  ] ++ (builtins.attrValues outputs.nixosModules);

  programs.vim.defaultEditor = true;
  
  environment.systemPackages = with pkgs; [
    any-nix-shell
    killall
    rsync
    nixpkgs-fmt
    bitwarden-cli
  ];

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };
}
