{ inputs, ... }: {
  imports = [
    ./common
    ./components/cli
  ];
  colorScheme = inputs.nix-colors.colorschemes.black-metal-immortal;
}
