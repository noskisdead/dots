{
  hardware.bluetooth = {
    enable = true;
    settings.General.Experimental = true; # battery status
  };
  services.blueman.enable = true; # Graphical bluetooth helper
}
