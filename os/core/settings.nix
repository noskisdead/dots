{pkgs, ...}: {
  security.apparmor = {
    enable = true;
    packages = with pkgs; [apparmor-profiles];
  };

  hardware.cpu.intel.updateMicrocode = true;
  hardware.cpu.amd.updateMicrocode = true;
  nixpkgs.config.allowUnfree = true; # Allow unfree packages
  nix.settings.experimental-features = ["nix-command" "flakes"]; # Enables support for flakes
  system.stateVersion = "25.05"; # dont change it por favor :)
}
