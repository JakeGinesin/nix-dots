{pkgs, ...}: let
  # bctl = "/run/current-system/sw/bin/bluetoothctl";
  # sctl = "/run/current-system/sw/bin/systemctl";
  # grep = "/run/current-system/sw/bin/grep";
  # wc = "/run/current-system/sw/bin/wc";
  tailscale = "/run/current-system/sw/bin/tailscale";
  rg = "/etc/profiles/per-user/synchronous/bin/rg";
  hostname = "/run/current-system/sw/bin/hostname";
  ip = "/run/current-system/sw/bin/ip";
  cut = "/run/current-system/sw/bin/cut";
  awk = "/run/current-system/sw/bin/awk";
in
  pkgs.writeShellScriptBin "tailscale-ctl" ''
    tailscale status | rg "$(hostname)" &> /dev/null && echo "%{F#2193ff}⍀ %{F#ffffff}[$(ip addr show tailscale0 | rg "inet " | awk '{print $2}' | cut -d'/' -f1 )]" || echo ""
  ''
