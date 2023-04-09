# DOES NOT WORK
{ lib, pkgs, runelite, bottles, makeDesktopItem}:

pkgs.stdenv.mkDerivation rec {
  name = "jagex-launcher";
  src = ./.;
  buildInputs = with pkgs; [
    bottles
    runelite
  ];
  dontUnpack = true;

  buildPhase = ''
    export HOME=$(pwd)
    bottles-cli new \
      --bottle-name jagex-launcher \
      --environment custom \
      --custom-environment $src/bottle.yml
  '';
  installPhase = ''
    bottles-cli add \
      --bottle jagex-launcher \
      --name runelite \
      --path ${runelite.out}

    bottles-cli reg \
      --bottle jagex-launcher \
      --key "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Uninstall\RuneLite Launcher_is1" \
      --value "InstallLocation" \
      --data "${runelite.out}" \
      --key-type REG_DWORD

     echo "#!/bin/sh" > $out/bin/jagex-launcher
     echo "bottles-cli run --bottle jagex-launcher --executable $out/files/JagexLauncher.exe" >> $out/bin/jagex-launcher
     chmod +x $out/bin/jagex-launcher
  '';

  jagexLauncherItem = makeDesktopItem {
    name = "jagex-launcher";
    exec = "jagex-launcher";
    comment = "Jagex Launcher";
    desktopName = "Jagex Launcher";
    genericName = "Jagex Launcher";
    categories = [ "Game" ];
  };
}
