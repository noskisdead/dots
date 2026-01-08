{ config, ... }:

{
  imports = [
    ./programs/browser.nix
    ./programs/caelestia.nix
    ./programs/defaultapps.nix
    # ./programs/media.nix
    ./programs/foot.nix
    ./programs/git.nix
    ./programs/hyprland.nix
    ./programs/messaging.nix
    ./programs/neovim.nix
    ./programs/productivity.nix
    ./programs/shell.nix
  ];
}
