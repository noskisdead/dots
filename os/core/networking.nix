{
  networking = {
    hostName = "pen";
    nameservers = ["1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one"];
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
    settings.Resolve = {
      DNSOverTLS = "true";
      FallbackDNS = ["1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one"];
      Domains = ["~."];
      DNSSEC = "true";
    };
  };

  # Keyring for secure password management
  services.gnome.gnome-keyring.enable = true;

  # VPN
  # services.mullvad-vpn = {
  #   enable = true;
  #   package = pkgs.mullvad-vpn;
  # };
}
