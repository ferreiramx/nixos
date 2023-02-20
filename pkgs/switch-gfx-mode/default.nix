{ pkgs }:

pkgs.writeShellScriptBin "switch-gfx-mode" ''
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
''
