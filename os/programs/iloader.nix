{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    iloader
  ];
  services.usbmuxd.enable = true;
}
