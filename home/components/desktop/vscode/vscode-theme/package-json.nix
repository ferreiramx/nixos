{ scheme }:
{
    name = "nix-colors-${scheme.slug}";
    publisher = "aferreira";
    displayName = "${scheme.name} Nix Colors Theme";
    description = "Dynamic color theme using nix-colors";
    version = "1.0.0";
    engines = {
      vscode = "^1.70.0";
    };
    categories = [
      "Themes"
    ];
    contributes = {
      themes = [
        {
          label = "nix-colors-${scheme.slug}";
          uiTheme = "vs-dark";
          path = "./nix-colors.json";
        }
      ];
    };
}