{ config, pkgs, ... }:

{
  services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
    tray = "never";
    settings = {
      icon_names.media = [ "media-optical" ];
    };
  };
}
