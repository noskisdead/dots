{ config, pkgs, ... }:

{
  programs.caelestia = {
    enable = true;
    systemd = {
      enable = false; # if you prefer starting from your compositor
      target = "graphical-session.target";
      environment = [];
    };
    settings = {
      bar.status = {
        showBattery = false;
      };
      paths.wallpaperDir = "~/.nix/misc/wallpapers";
    };
    cli = {
      enable = true; # Also add caelestia-cli to path
      settings = {
        theme.enableGtk = false;
      };
    };
  };
}
