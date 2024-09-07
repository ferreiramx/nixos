# TODO: Parametrize the rest of the possible options
{ pkgs }:
{ scheme }:
let
  theme = {
    accentFromPage = false;
    accentOnWindow = false;
    accentSaturationLimit = 1;
    alpha = 1;
    backgroundImage = "";
    backgroundPosition = "stretch";
    blur = 0;
    colorAccentBg = scheme.palette.base01;
    colorBg = scheme.palette.base00;
    colorFg = scheme.palette.base05;
    colorHighlightBg = scheme.palette.base04;
    colorWindowBg = scheme.palette.base00;
    contrast = -5;
    dimBlurred = false;
    engineVersion = 1;
    id = "be4f4523-b688-42a6-aa8d-b094af3cf43d";
    name = scheme.slug;
    preferSystemAccent = false;
    radius = 12;
    simpleScrollbar = false;
    transparencyTabBar = false;
    transparencyTabs = true;
    url = "";
    version = 1;
  };
in
pkgs.stdenv.mkDerivation {
  name = "generated-vivaldi-theme-${scheme.slug}.zip";
  src = pkgs.writeTextFile {
    name = "settings.json";
    text = (builtins.toJSON theme);
  };
  buildInputs = with pkgs; [ zip ];
  unpackPhase = "true";
  buildPhase = ''
    # Rename the file to settings.json as Vivaldi expects it
    mkdir tmp
    cp $src tmp/settings.json
    # Compress into a .zip file
    zip -rj theme.zip tmp
  '';
  installPhase = "install -Dm0644 theme.zip $out";
}
