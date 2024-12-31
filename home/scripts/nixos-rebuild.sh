#!/usr/bin/env bash
# blatently adapted from: https://gist.github.com/0atman/1a5133b842f929ba4c1e195ee67599d5

# set -e

# Edit your config
# $EDITOR configuration.nix

# cd to your config dir
pushd /home/synchronous/nix-cfg

# Early return if no changes were detected (thanks @singiamtel!)
if git --git-dir /home/synchronous/nix-cfg/.git diff --quiet; then
    echo "No changes detected, exiting."
    popd
    exit 0
fi

# Autoformat your nix files
alejandra . &>/dev/null \
  || ( alejandra . ; echo "formatting failed!" && exit 1)

# Shows your changes
git --git-dir /home/synchronous/nix-cfg/.git --no-pager diff -U0 
# '*.nix'

echo ""
echo "NixOS Rebuilding..."

# Rebuild, output simplified errors, log trackebacks
sudo nixos-rebuild switch --flake /home/synchronous/nix-cfg/flake.nix &> /tmp/nixos-switch.log 
# cat /tmp/nixos-switch.log | grep --color error && exit 1

if grep --color error /tmp/nixos-switch.log; then
    # cat /tmp/nixos-switch.log | grep --color error
    read -p "Would you like to view the error log? (y/n): " choice
    choice=${choice:-n}
    if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
      cat /tmp/nixos-switch.log
    fi
    exit 1;
fi

# Get current generation metadata
current=$(nixos-rebuild list-generations | grep current)

# Commit all changes witih the generation metadata
git --git-dir /home/synchronous/nix-cfg/.git commit -am "$current"

# Back to where you were
popd

# rm /tmp/nixos-switch.log

# Notify all OK!
notify-send -e "NixOS Rebuilt OK!" --icon=software-update-available

echo ""
echo "Full rebuild log in /tmp/nixos-switch.log"
