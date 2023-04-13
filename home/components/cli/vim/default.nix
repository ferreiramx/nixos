{ inputs, pkgs, config, ... }:
let
  nix-colors-lib = inputs.nix-colors.lib-contrib { inherit pkgs; };
in
{
  programs.vim.plugins = [
    {
      plugin = nix-colors-lib.vimThemeFromScheme { scheme = config.colorScheme; };
      config = "colorscheme ${config.colorScheme.slug}";
    }
  ];
}
