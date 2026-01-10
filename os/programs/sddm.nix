{ pkgs, lib, ... }:

let
  sddmTheme = pkgs.sddm-astronaut.override {
    embeddedTheme = "jake_the_dog";
  };
in
{
  services.displayManager.defaultSession = "hyprland";

  services.displayManager.autoLogin = {
    enable = true;
    user = "kenny";
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = lib.mkForce pkgs.kdePackages.sddm;
    theme = "sddm-astronaut-theme";

    # Dependencies go here so SDDM can load them
    extraPackages = with pkgs; [
      kdePackages.qtsvg
      kdePackages.qtmultimedia
      kdePackages.qtvirtualkeyboard
    ];
  };

  # Theme goes here so it links to /run/current-system/sw/share/sddm/themes
  environment.systemPackages = [
      sddmTheme
    ];
}
