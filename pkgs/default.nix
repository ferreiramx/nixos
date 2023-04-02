# TODO: Move vscode-nix-colors here
{ pkgs }: {
  # vscode-nix-colors = pkgs.callPackage ./vscode { };
  switch-gfx-mode = pkgs.callPackage ./switch-gfx-mode { };
  touchpad-toggle = pkgs.callPackage ./touchpad-toggle { };
}
