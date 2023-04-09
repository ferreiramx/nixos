{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    runelite
    # jagex-launcher
  ];
}
