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
in {
  services.polybar = {
    enable = true;
    package = mypolybar;
    extraConfig = builtins.readFile ./config.ini;
    # my savior: https://www.reddit.com/r/NixOS/comments/v8ikwq/polybar_doesnt_start_at_launch/
    script = ''
      # echo "none"
      polybar mybar 2> /dev/null & disown
    '';
  };

  # home.activation.polybarStartup = lib.hm.dag.entryAfter ["writeBoundary"] ''
  #   exec /etc/profiles/per-user/synchronous/bin/polybar -c /home/synchronous/.config/polybar/config.ini mybar & disown
  # '';

  systemd.user.services.polybar = {
    Install.WantedBy = ["graphical-session.target"];
  };

  home.activation.copyPolybarScriptsDir = lib.mkAfter ''
    mkdir -p ~/.config/polybar/scripts
    cp -r ${./scripts}/* ~/.config/polybar/scripts
    chmod -R +x ~/.config/polybar/scripts
  '';
}
