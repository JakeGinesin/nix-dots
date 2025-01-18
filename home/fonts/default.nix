{pkgs, ...}: {
  # bruh moment
  home.packages = with pkgs; [
    fontconfig
  ];

  home.file.".local/share/fonts/NotoSans-Regular.ttf".source = ./NotoSans-Regular.ttf;
  home.file.".local/share/fonts/NotoSansSymbols-Regular.ttf".source = ./NotoSansSymbols-Regular.ttf;
}
