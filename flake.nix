{
  description = "aferreira nixos config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Nixos-hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Nix-colors
    nix-colors.url = "github:misterio77/nix-colors";

    # Secrets management
    sops-nix.url = "github:mic92/sops-nix";

    # Nixified Spicetify
    spicetify-nix.url = "github:the-argus/spicetify-nix";

    # Devenv
    devenv.url = "github:cachix/devenv/latest";

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";

    # eww-hyprland
    eww = {
      url = "github:elkowar/eww";
      inputs.nixpkgs.follows = "nixpkgs";
      # inputs.rust-overlay.follows = "rust-overlay";
    };
  
    # vscode-server
    vscode-server = {
      url = "github:nix-community/nixos-vscode-server";
    };

  };

  outputs = { self, nixpkgs, home-manager, devenv, sops-nix, ... }@inputs:
    let
      inherit (self) outputs;
      forEachSystem = nixpkgs.lib.genAttrs [ "x86_64-linux" ];
      forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});
    in
    {
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;
      
      overlays = import ./overlays { inherit inputs outputs; };

      packages = forEachPkgs (pkgs: import ./pkgs { inherit pkgs; });
      devShells = forEachPkgs (pkgs: import ./shell.nix { inherit pkgs; });

      nixosConfigurations = {
        # Work Laptop
        kiryu = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [./hosts/kiryu ];
        };

        # Main Desktop
        mugendramon = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [./hosts/mugendramon ];
        };

        # Home Server
        gigadramon = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [./hosts/gigadramon ];
        };
      };

      homeConfigurations = {
        # Work Laptop
        "aferreira@kiryu" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home/kiryu.nix ];
        };

        # Main Desktop
        "aferreira@mugendramon" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home/mugendramon.nix ];
        };

        # Home Server
        "aferreira@gigadramon" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home/gigadramon.nix ];
        };
      };
    };
}
