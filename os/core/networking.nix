{ config, pkgs, ... }:

{
  networking = {
    hostName = "pen";
    nameservers = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      ethernet.macAddress = "random";
      wifi.macAddress = "random";
      wifi.scanRandMacAddress = true;
    };
  };

  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "~." ];
    fallbackDns = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
    dnsovertls = "true";
  };

  # VPN
  # services.mullvad-vpn = {
  #   enable = true;
  #   package = pkgs.mullvad-vpn;
  # };
}
