{
  inputs,
  pkgs,
  ...
}: {
  # GameCube adapter optimization
  imports = [inputs.slippi.nixosModules.default];
  programs = {
    appimage = {
      enable = true;
      binfmt = true;
      package = pkgs.appimage-run.override {
        extraPkgs = pkgs: [
          pkgs.curlMinimal.out
        ];
      };
    };
    steam = {
      enable = false;
      gamescopeSession.enable = true;
      protontricks.enable = true;
      # extest.enable = true; # Enables Steam Input
      extraCompatPackages = [pkgs.proton-ge-bin];
    };
    gamemode.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # hardware.xone.enable # Enables support for Xbox controllers

  environment.systemPackages = with pkgs; [
    inputs.slippi.packages.x86_64-linux.default
    lunar-client # Another MC client
    parsec-bin
    prismlauncher # MC launcher
    heroic # Epic and GOG game launcher
    olympus # Celeste Mod Manager
    # scarab # Hollow Knight Mod Manager
    # winboat # Windows VM
  ];
}
