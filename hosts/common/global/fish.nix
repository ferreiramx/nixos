{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    vendor = {
      completions.enable = true;
      config.enable = true;
      functions.enable = true;
    };
  };
  environment.systemPackages = with pkgs.fishPlugins; [
    bass
    tide
    sponge
    colored-man-pages
    autopair-fish
  ];
}
