{ inputs, lib, config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    arandr
    viewnior
    gotop
    scrot
  ];
  programs.file-roller.enable = true;
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-volman
      thunar-archive-plugin
    ];
  };

  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs;[
    source-code-pro
    source-sans-pro
    (nerdfonts.override { fonts = [ "SourceCodePro" ]; })
    font-awesome
    material-design-icons
  ];
}
