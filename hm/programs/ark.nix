{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.ark
    p7zip
    unrar
    zip
    unzip
    gzip
  ];
}
