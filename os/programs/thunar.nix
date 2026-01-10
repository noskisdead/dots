{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    thunar
    thunar-volman
    thunar-archive-plugin
  ];

  services.udisks2.enable = true; # USB
  services.gvfs.enable = true; # Trash
  services.tumbler.enable = true; # Thumbnail support for images
}
