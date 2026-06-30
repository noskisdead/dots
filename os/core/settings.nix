{
  nixpkgs.config.allowUnfree = true; # Allow unfree packages
  system.stateVersion = "25.05"; # dont change it por favor :)
  nix.settings = {
    experimental-features = ["nix-command" "flakes"]; # Enables support for flakes
    extra-substituters = ["https://nvf.cachix.org"];
    trusted-public-keys = ["nvf.cachix.org-1:GMQWiUhZ6ux9D5CvFFMwnc2nFrUHTeGaXRlVBXo+naI="];
  };
}
