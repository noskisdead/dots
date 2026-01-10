{ config, pkgs, ... }:

{
  imports = [
    ./core/audio.nix
    ./core/boot.nix
    ./programs/env.nix
    ./core/fonts.nix
    ./services/geoclue.nix
    ./core/maintenance.nix
    ./core/networking.nix
    ./programs/portals.nix
    ./core/settings.nix
    ./core/shell.nix
    ./core/time.nix
    ./core/users.nix
    ./programs/ui.nix
    ./programs/sddm.nix
    # ./programs/cyber.nix
    # ./programs/gaming.nix
  ];
}
