{pkgs, ...}: let
  bctl = "/run/current-system/sw/bin/bluetoothctl";
  sctl = "/run/current-system/sw/bin/systemctl";
in
  pkgs.writeShellScriptBin "bluetooth-ctl" ''
    if [ $(${bctl} show | grep "Powered: yes" | wc -c) -eq 0 ]
    then
      echo ""
    else
      if [ $(echo info | ${bctl} | grep 'Device' | wc -c) -eq 0 ]
      then
        echo ""
      fi
      device=$(${bctl} info | grep "Name" | cut -d ' ' -f 2-)
      if [[ "$device" == "" ]]
      then
        echo "%{F#2193ff}"
      else
        echo "%{F#2193ff}  %{F#ffffff}[$device]"
      fi
    fi
  ''
