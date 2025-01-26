# scripts.nix
{pkgs, ...}: {
  home.packages = with pkgs; [
    (writeShellApplication {
      name = "termbin";
      runtimeInputs = with pkgs; [
        netcat
      ];

      text = ''
        file=$1
        cat "$1" | nc termbin.com 9999
      '';
    })
  ];
}
