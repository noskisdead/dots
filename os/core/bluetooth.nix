{ config, pkgs, ... }:

{
  hardware.bluetooth.enable = true;

  # Battery status
  hardware.bluetooth.settings = {
    General = {
      Experimental = true;
    };
  };
}
