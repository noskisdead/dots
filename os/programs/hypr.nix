{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true; # Disable and become based gng <3
  };

  environment.systemPackages = with pkgs; [
    hyprpicker # color picker :3
  ];
}
