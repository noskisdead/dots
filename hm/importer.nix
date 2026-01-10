{ config, ... }:

{
  imports = [
    ./programs/browser.nix
    ./programs/caelestia.nix
    ./services/cliphist.nix
    ./settings/cursor.nix
    ./settings/darktheme.nix
    ./programs/defaultapps.nix
    ./programs/media.nix
    ./programs/foot.nix
    ./services/gammastep.nix
    ./programs/git.nix
    ./programs/hyprland.nix
    ./services/mpris-proxy.nix
    ./programs/messaging.nix
    ./programs/neovim.nix
    ./programs/productivity.nix
    ./programs/thunar.nix
    ./programs/qbittorrent.nix
    ./programs/shell.nix
    ./programs/tealdeer.nix
    ./services/udiskie.nix
  ];
}
