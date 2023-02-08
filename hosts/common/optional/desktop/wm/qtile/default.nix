{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ../../x11
  ];
  services.xserver.windowManager.qtile.enable = true;
  nixpkgs.overlays = [
    (
      self: super: {
        qtile = super.qtile.unwrapped.override (old: {
          propagatedBuildInputs = (old.propagatedBuildInputs or [ ]) ++ (with self.python3Packages; [
            dbus-next
          ]);
        });
      }
    )
  ];
  environment.systemPackages = with pkgs; [
    i3lock-color
  ];
}
