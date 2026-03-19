{pkgs}: {
  virtualisation.docker = {
    enabled = true;
  };

  environment.systemPackages = with pkgs; [
    exegol
  ];
}
