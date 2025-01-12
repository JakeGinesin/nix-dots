{
  config,
  pkgs,
  lib,
  ...
}: let
  mypolybar = pkgs.polybar.override {
    alsaSupport = true;
    githubSupport = true;
    mpdSupport = true;
    pulseSupport = true;
  };

  colors = {
    background = "#0d0d0d";
    foreground = "#ffffff";
    theme = "#89adfa";
  };

  bluetoothScript = pkgs.callPackage ./scripts/bluetooth.nix {};

  bctl = ''
    [module/bluetooth]
    type = custom/script
    interval = 10
    exec = ${bluetoothScript}/bin/bluetooth-ctl
    label-foreground = ${colors.foreground}
    format-foreground = ${colors.theme}
  '';
in {
  services.polybar = {
    enable = true;
    package = mypolybar;
    config = ./config.ini;
    extraConfig = bctl;
    # my savior: https://www.reddit.com/r/NixOS/comments/v8ikwq/polybar_doesnt_start_at_launch/
    script = ''
      # echo "none"
      polybar mybar 2> /dev/null & disown
    '';
  };

  # home.activation.polybarStartup = lib.hm.dag.entryAfter ["writeBoundary"] ''
  #   exec /etc/profiles/per-user/synchronous/bin/polybar -c /home/synchronous/.config/polybar/config.ini mybar & disown
  # '';

  home.activation.polybarRestart = lib.hm.dag.entryAfter ["writeBoundary"] ''
    /etc/profiles/per-user/synchronous/bin/systemctl --user restart polybar
  '';

  systemd.user.services.polybar = {
    Install.WantedBy = ["graphical-session.target"];
  };

  # home.activation.copyPolybarScriptsDir = lib.mkAfter ''
  # mkdir -p ~/.config/polybar/scripts
  # cp -r ${./scripts}/* ~/.config/polybar/scripts
  # chmod -R +x ~/.config/polybar/scripts
  # '';
}
