{pkgs, ...}: {
  programs = {
    gamemode.enable = true;
    appimage.enable = true; # For AppImage support (e.g., Slippi)
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      protontricks.enable = true;
      # extest.enable = true; # Enables Steam Input
      extraCompatPackages = [pkgs.proton-ge-bin];
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # hardware.xone.enable # Enables support for Xbox controllers

  environment.systemPackages = with pkgs; [
    lunar-client # Another MC client
    prismlauncher # MC launcher
    heroic # Epic and GOG game launcher
    olympus # Celeste Mod Manager
    # scarab # Hollow Knight Mod Manager
    # winboat # Windows VM
  ];
}
