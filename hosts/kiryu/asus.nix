{ pkgs, ... }: {
  # Enable asusd
  services.asusd = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Enable nvidia-offload script
    (writeShellScriptBin "nvidia-offload" ''
      export __NV_PRIME_RENDER_OFFLOAD=1
      export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
      export __GLX_VENDOR_LIBRARY_NAME=nvidia
      export __VK_LAYER_NV_optimus=NVIDIA_only
      exec "$@"
    '')
    # Enable supergfxctl toggle mode script
    (writeShellScriptBin "switch-gfx-mode" ''
      mode=$(supergfxctl --get)
      if [ "$mode" == "integrated" ]; then
        supergfxctl --mode hybrid
        dunstify "Graphics mode changed" "Hybrid mode activated. Please log out to finish the mode switch."
      elif [ "$mode" == "hybrid" ]; then
        supergfxctl --mode integrated
        dunstify "Graphics mode changed" "Integrated mode activated. Please log out to finish the mode switch."
      else
        echo "Unknown mode: $mode"
      fi
    '')
  ];
}
