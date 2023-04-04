{ inputs, pkgs,vars, ... }: {
  imports = [
    ./colors.nix
    ./scripts.nix
    ./windows
  ];

  xdg.configFile."eww/eww.yuck".text = ''
    (include "./windows/bar.yuck")
    ; (include "./windows/calendar.yuck")
    ; (include "./windows/music.yuck")
    ; (include "./windows/osd.yuck")
    ; (include "./windows/system-menu.yuck")
  '';
  xdg.configFile."eww/eww.scss".text = ''
    @import 'css/colors';
    @import 'css/bar';
    // @import 'css/calendar';
    // @import 'css/music';
    // @import 'css/osd';
    // @import 'css/sidebar';
    // @import 'css/system';
    // @import 'css/volume';
  '';
}
