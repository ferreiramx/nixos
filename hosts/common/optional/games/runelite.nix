{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    runelite
  ];
}
