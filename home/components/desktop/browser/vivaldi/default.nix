{ pkgs, config, ... }: 
let
  vivaldiThemeFromScheme = import ./vivaldi-theme.nix { inherit pkgs; };
in
{
  xdg.configFile."vivaldi/vivaldi-theme-${config.colorScheme.slug}.zip".source = vivaldiThemeFromScheme {
    scheme = config.colorScheme;
  };  
}
