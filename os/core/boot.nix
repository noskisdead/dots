{
  # Bootloader configuration
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10; # or boot.loader.grub.configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
  };
}
