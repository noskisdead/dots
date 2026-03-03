{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    thunar
    thunar-volman
    thunar-archive-plugin
    yazi
  ];

  services = {
    udisks2.enable = true; # USB
    gvfs.enable = true; # Trash
    tumbler.enable = true; # Thumbnail support for images
  };
}
