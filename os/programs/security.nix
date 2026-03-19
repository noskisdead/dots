{pkgs, ...}: {
  virtualisation.docker = {
    enable = true;
    rootless.enable = true;
  };

  environment.systemPackages = with pkgs; [
    exegol
  ];
}
