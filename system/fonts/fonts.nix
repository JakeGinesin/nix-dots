{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      corefonts
      fira-code
      fira-code-symbols
      font-awesome_4
      font-awesome_5
      inconsolata
      ipaexfont
      jetbrains-mono
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      siji
      ubuntu_font_family
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = ["Fira Code"];
      };
    };
  };
}
