{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true; # Disable and become based gng <3
  };

  # Things used in my hyprland config
  environment.systemPackages = with pkgs; [
    fuzzel # for clipboards :3
    gammastep # night light
    geoclue2-with-demo-agent # Geo for gammastep
    hyprpicker # color picker :3
    trash-cli # trash
  ];
}
