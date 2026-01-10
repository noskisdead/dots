{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    corefonts
    inter
    nerd-fonts.caskaydia-mono
  ];
}
