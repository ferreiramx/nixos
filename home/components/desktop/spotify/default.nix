{ inputs, config, pkgs, ... }:
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
        text = "${colors.base05}";
        subtext = "${colors.base04}";
        main = "${colors.base00}";
        player = "${colors.base00}";
        button = "${colors.base04}";
        button-text = "${colors.base05}";
        sub-button = "${colors.base04}";
        subbutton-text = "${colors.base05}";
        button-active = "${colors.base07}";
        button-disabled = "${colors.base03}";
        notification = "${colors.base05}";
        playback-bar = "${colors.base06}";
        shadow = "${colors.base00}";
        selected-row = "${colors.base03}";
        notification-error = "${colors.base08}";
        card = "${colors.base01}";
        sidebar = "${colors.base00}";
        tab-active = "${colors.base02}";
        misc = "${colors.base0E}";
      };
      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplay
        shuffle
        hidePodcasts
      ];
    };
}
