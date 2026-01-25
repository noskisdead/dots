{
  imports = [
    ./hardware-configuration.nix
    ../../os/importer.nix
  ];

  networking.hostName = "pearl";

  # Temporary things since this laptop doesnt have a nix-hardware config
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
}
