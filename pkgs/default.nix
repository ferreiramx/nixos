{ pkgs }: {
  # vscode-nix-colors = pkgs.callPackage ./vscode { };
  switch-gfx-mode = pkgs.callPackage ./switch-gfx-mode { };
  touchpad-toggle = pkgs.callPackage ./touchpad-toggle { };
  deepchannel = pkgs.callPackage ./deepchannel { };
  jagex-launcher = pkgs.callPackage ./jagex-launcher { };
}
