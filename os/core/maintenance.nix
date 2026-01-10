{
  # Updating
  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    randomizedDelaySec = "45min";
    dates = "daily";
    flake = "github:noskisdead/dots";
    flags = [
      "--update-input"
      "nixpkgs"
    ];
  };
  
  # Garbage Collection
  programs.nh = {
    enable = true;
    flake = "/home/kenny/.nix/";
    clean.enable = true;
    clean.dates = "weekly";
    clean.extraArgs = "--keep 3 --keep-since 3d";
  };

  # Nix Store Optimise
  nix.optimise = {
    automatic = true;
  };
}
