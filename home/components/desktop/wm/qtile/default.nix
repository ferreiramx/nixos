{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./scripts.nix
    ../../rofi
    ../../picom
  ];
  xdg.configFile = {
    "qtile/config.py".text = (import ./config.nix {inherit lib;});
    "qtile/modules/bar.py".text = (import ./modules/bar.nix {inherit lib;});
    "qtile/modules/groups.py".text = (import ./modules/groups.nix {inherit lib;});
    "qtile/modules/hooks.py".text = (import ./modules/hooks.nix {inherit lib;});
    "qtile/modules/keys.py".text = (import ./modules/keys.nix {inherit lib;});
    "qtile/modules/layouts.py".text = (import ./modules/layouts.nix {inherit lib;});
    "qtile/modules/screens.py".text = (import ./modules/screens.nix {inherit lib;});
    "qtile/modules/theme.py".text = (import ./modules/theme.nix {inherit lib;});
    "qtile/modules/utils.py".text = (import ./modules/utils.nix {inherit lib;});
  };
}
