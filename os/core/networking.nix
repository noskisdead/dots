{ config, pkgs, ... }:

{
  networking = {
    hostName = "pen";
    networkmanager = {
      enable = true;
      wifi.scanRandMacAddress = true;
      wifi.macAddress = "random";
    };
  };

  # VPN
  # services.mullvad-vpn = {
  #   enable = true;
  #   package = pkgs.mullvad-vpn;
  # };
}
