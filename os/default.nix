{ config, pkgs, ... }:

{
  imports = [
    ./core/audio.nix
    ./core/boot.nix
    ./core/fonts.nix
    ./core/maintenance.nix
    ./core/networking.nix
    ./core/settings.nix
    ./core/shell.nix
    ./core/time.nix
    ./core/users.nix
    ./programs/hypr.nix
    ./programs/sddm.nix
    # ./programs/cyber.nix
    # ./programs/gaming.nix
  ];
}
