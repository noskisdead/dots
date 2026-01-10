{ pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    equicord
  ];
}
