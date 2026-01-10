{ config, pkgs, ... }:

{
  programs.tealdeer = {
    enable = true;
    enableAutoUpdates = true;
  };
}
