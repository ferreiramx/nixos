{ pkgs }: {
  # vscode-nix-colors = pkgs.callPackage ./vscode { };
  nvidia-offload =  pkgs.callPackage ./nvidia-offload { };
  switch-gfx-mode =  pkgs.callPackage ./switch-gfx-mode { };
}
