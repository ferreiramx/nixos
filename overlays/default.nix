{ inputs, outputs }:
{
  # Adds my custom packages
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # Modifies existing packages
  modifications = final: prev: {
    qtile = prev.qtile.unwrapped.override (old: {
      propagatedBuildInputs = (old.propagatedBuildInputs or [ ]) ++ (with final.python3Packages; [
        dbus-next
      ]);
    });
    waybar = prev.waybar.overrideAttrs(oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });
  };
}
