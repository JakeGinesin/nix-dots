uhuh yeah endgame nixos config

# Install
if you're me, you need to bootstrap your secrets for agenix to work right:
```
cp -r /home/sync/.ssh /mnt/home/sync/.ssh
cp /home/sync/Passwords.kdbx /mnt/home/sync/.config/keep
```
if you're not me, you probably have to go in my config and change things for nix to build everything. 

then, proceed with regular installation:
```
sudo nixos-install --root /mnt --flake github:jakeginesin/nix-dots#thonkpad
```
And rebuild with:
```
sudo nixos-rebuild switch --flake.#thonkpad
```

# Some crazy dotfiles
- [Sylk0s](https://github.com/sylk0s/dotfiles)
- [Cajunvoodoo's](https://github.com/Cajunvoodoo/dotfiles)
- [damhiya](https://github.com/damhiya)
- [masterofnull](https://github.com/MasterofNull/nixos)
- [hlissner](https://github.com/hlissner/dotfiles) (also uses bspwm)
