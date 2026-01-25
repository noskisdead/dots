{pkgs, ...}: {
  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    protontricks.enable = true;
    # extest.enable = true; # Enables Steam Input
    extraCompatPackages = [pkgs.proton-ge-bin];
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # programs.appimage.enable = true; # For AppImage support (e.g., Slippi)
  # hardware.xone.enable # Enables support for Xbox controllers

  environment.systemPackages = with pkgs; [
    prismlauncher # MC launcher
    heroic # Epic and GOG game launcher
    osu-lazer-bin # Osu!
    # olympus # Celeste Mod Manager
    # scarab # Hollow Knight Mod Manager
    # winboat # Windows VM
  ];

  # Roblox, since Sober is only on flatpak rn
  services.flatpak.packages = [
    "org.vinegarhq.Sober"
  ];
}
