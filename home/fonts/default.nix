{pkgs, ...}: {
  # bruh moment
  home.packages = with pkgs; [
    fontconfig
  ];

  # god's chosen fontset
  home.file.".local/share/fonts/NotoSans-Regular.ttf".source = ./NotoSans-Regular.ttf;
  home.file.".local/share/fonts/NotoSansSymbols-Regular.ttf".source = ./NotoSansSymbols-Regular.ttf;
  home.file.".local/share/fonts/JetBrains-Mono-Nerd-Font-Complete-Regular.ttf".source = ./JetBrains-Mono-Nerd-Font-Complete-Regular.ttf;
}
