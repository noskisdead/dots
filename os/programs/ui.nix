{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true; # Disable and become based gng <3
  };

  environment.systemPackages = with pkgs; [
    gammastep # night light
    geoclue2-with-demo-agent # Geo for gammastep
    hyprpicker # color picker :3
    trash-cli # trash
    wl-clipboard # idk clipboard thingy
  ];
}
