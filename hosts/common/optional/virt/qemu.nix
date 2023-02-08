{ inputs, lib, config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    qemu_full
    virt-manager
  ];
}
