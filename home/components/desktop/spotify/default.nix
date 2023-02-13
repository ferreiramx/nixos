{ inputs, lib, config, pkgs, ... }:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
  colors = config.colorScheme.colors;
in
{
  programs.spicetify =
    let
      officialThemes = pkgs.fetchgit {
        url = "https://github.com/spicetify/spicetify-themes";
        rev = "eb6b818368d9c01ef92522623b37aa29200d0bc0";
        sha256 = "1qrcvbxb0pmx0g8kzbb8yp20fdhf457jqdyfzs7nbdz3wr5w3wj3";
      };
    in
    {
      enable = true;
      theme = {
        name = "Glaze";
        src = officialThemes;
        appendName = true;
        injectCss = true;
        replaceColors = true;
        overwriteAssets = true;
        sidebarConfig = true;
      };
      colorScheme = "custom";
      customColorScheme = {
        button = "${colors.base0A}";
        notification = "${colors.base09}";
        playback-bar = "${colors.base09}";
        button-disabled = "${colors.base09}";
        shadow = "${colors.base02}";
        selected-row = "${colors.base03}";
        sub-button = "${colors.base01}";
        main = "${colors.base01}";
        notification-error = "${colors.base09}";
        subtext = "${colors.base05}";
        card = "${colors.base01}";
        sidebar = "${colors.base01}";
        button-active = "${colors.base0B}";
        tab-active = "${colors.base0B}";
        subbutton-text = "${colors.base03}";
        text = "${colors.base0A}";
        misc = "${colors.base0F}";
        player = "${colors.base01}";
        button-text = "${colors.base05}";
      };
      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplay
        shuffle
        hidePodcasts
      ];
    };
  # xdg.configFile."spicetify/Themes/nix-colors/color.ini".text = (import ./colorscheme.nix {inherit config;});
  # xdg.configFile."spicetify/Themes/nix-colors/user.css".source = ./user.css;
}
