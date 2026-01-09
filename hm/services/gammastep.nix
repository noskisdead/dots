{ config, pkgs, ... }:

{
  # Geoclue configured in os
  services.gammastep = {
    enable = true;
    provider = "geoclue2";
    tray = true; 
  };
}
