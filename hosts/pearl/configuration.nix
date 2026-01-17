{
  config,
  lib,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../os/importer.nix
  ];
  networking.hostName = "pearl";

  # Temporary things since this laptop doesnt have a nix-hardware config
  services.tlp.enable = lib.mkDefault (!config.services.power-profiles-daemon.enable);
}
