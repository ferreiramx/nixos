{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./scripts.nix
  ];
  xdg.configFile = {
    "qtile/config.py".text = (import ./config.nix);
    "qtile/modules/bar.py".text = (import ./modules/bar.nix);
    "qtile/modules/groups.py".text = (import ./modules/groups.nix);
    "qtile/modules/hooks.py".text = (import ./modules/hooks.nix);
    "qtile/modules/keys.py".text = (import ./modules/keys.nix);
    "qtile/modules/layouts.py".text = (import ./modules/layouts.nix);
    "qtile/modules/screens.py".text = (import ./modules/screens.nix);
    "qtile/modules/theme.py".text = (import ./modules/theme.nix);
    "qtile/modules/utils.py".text = (import ./modules/utils.nix);
  };
}
