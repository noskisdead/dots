{
  nixpkgs.config.allowUnfree = true; # Allow unfree packages
  system.stateVersion = "25.05"; # dont change it por favor :)

  nix.settings = {
    experimental-features = ["nix-command" "flakes"]; # Enables support for flakes
    auto-optimise-store = true;
    extra-substituters = [
      "https://nvf.cachix.org"
      "https://slippi-nix.cachix.org"
    ];
    trusted-public-keys = [
      "nvf.cachix.org-1:GMQWiUhZ6ux9D5CvFFMwnc2nFrUHTeGaXRlVBXo+naI="
      "slippi-nix.cachix.org-1:2qnPHiOxTRpzgLEtx6K4kXq/ySDg7zHEJ58J6xNDvBo="
    ];
  };
}
