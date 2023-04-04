{ inputs, vars, ... }: {
  xdg.configFile."eww/modules/variables.yuck".text = ''
      (defvar bright_reveal false)
      (defvar bt_rev false)
      (defvar music_reveal false)
      (defvar net_rev false)
      (defvar time_rev false)
      (defvar vol_reveal false)
      (defvar osd-brightness false)
      (defvar osd-volume false)

      (defpoll time :interval "5s" `date +'{"date": "%d/%m", "hour": "%H", "minute": "%M", "day": "%A"}'`)

      ;(deflisten airplane "scripts/airplane")
      ;(deflisten battery "scripts/battery")
      ;(deflisten bluetooth "scripts/bluetooth")
      ;(deflisten brightness "scripts/brightness")
      ;(deflisten memory "scripts/memory")
      ;(deflisten music "scripts/music")
      ;(deflisten net "scripts/net")
      ;(deflisten volume "scripts/volume")
      (deflisten workspace "scripts/workspaces")
    '';
}
