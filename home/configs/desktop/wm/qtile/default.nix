{ inputs, lib, config, pkgs, ... }: {
  imports = [
      ./scripts
  ];
  xdg.configFile."qtile" = {
    "config.py".text = (import ./config.nix);
    "modules" = {
      "bar.py".text = (import ./modules/bar.nix);
      "groups.py".text = (import ./modules/groups.nix);
      "hooks.py".text = (import ./modules/hooks.nix);
      "keys.py".text = (import ./modules/keys.nix);
      "layouts.py".text = (import ./modules/layouts.nix);
      "screens.py".text = (import ./modules/screens.nix);
      "theme.py".text = (import ./modules/theme.nix);
      "utils.py".text = (import ./modules/utils.nix);
    };
  };
}