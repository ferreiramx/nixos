{ vars, ... }: {
  imports = [
    ./scripts.nix
    ../../rofi
    ../../picom
    ../../dunst
  ];
  xdg.configFile = {
    "qtile/config.py".text = import ./config.nix;
    "qtile/modules/bar.py".text = import ./modules/bar.nix vars;
    "qtile/modules/groups.py".text = import ./modules/groups.nix;
    "qtile/modules/hooks.py".text = import ./modules/hooks.nix;
    "qtile/modules/keys.py".text = import ./modules/keys.nix;
    "qtile/modules/layouts.py".text = import ./modules/layouts.nix vars;
    "qtile/modules/screens.py".text = import ./modules/screens.nix;
    "qtile/modules/theme.py".text = import ./modules/theme.nix vars;
    "qtile/modules/utils.py".text = import ./modules/utils.nix;
  };
}
