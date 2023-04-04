{ inputs, vars, ... }: {
  imports = [
    ./airplane.nix
    ./battery.nix
    ./bluetooth.nix
    ./brightness.nix
    ./default.nix
    ./memory.nix
    ./music.nix
    ./net.nix
    ./volume.nix
    ./workspaces.nix
  ] ++
  (
    if (vars.class == "laptop") then [
      ./battery.nix
      ./brightness.nix
    ]
    else [ ]
  );
}
