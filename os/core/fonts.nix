{pkgs, ...}: {
  fonts.packages = with pkgs; [
    corefonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.caskaydia-mono
  ];
}
