{
  security.apparmor.enable = true;
  nixpkgs.config.allowUnfree = true; # Allow unfree packages
  nix.settings.experimental-features = ["nix-command" "flakes"]; # Enables support for flakes
  system.stateVersion = "25.05"; # dont change it por favor :)
}
