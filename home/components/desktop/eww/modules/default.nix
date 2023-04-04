{ inputs, vars, ... }: {
  imports = [
    ./bluetooth.nix
    ./bright.nix
    ./clock.nix
    ./music.nix
    ./net.nix
    ./sys.nix
    ./volume.nix
    ./workspaces.nix
    ./variables.nix
  ];
}