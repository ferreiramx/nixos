{ inputs, vars, ... }: {
  imports = [
    ./clock.nix
    ./workspaces.nix
    ./variables.nix
  ];
}