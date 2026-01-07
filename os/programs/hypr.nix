{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true;

  environment.systemPackages = with pkgs; [
    kitty # temporary
  ];
}
