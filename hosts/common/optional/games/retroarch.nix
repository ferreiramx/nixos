{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    (retroarch.override {
      cores = [
        libretro.mgba
        libretro.pcsx2
        libretro.snes9x
        libretro.citra
        libretro.dosbox
        libretro.sameboy
        libretro.dolphin
        libretro.desmume
        libretro.nestopia
        libretro.pcsx-rearmed
        libretro.parallel-n64
      ];
    })
  ];
}
