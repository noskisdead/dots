{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    thunar
    thunar-volman
    thunar-archive-plugin
  ];
}
