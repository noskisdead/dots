{
  programs.caelestia = {
    enable = true;
    cli.enable = true;
    systemd = {
      enable = false; # if you prefer starting from your compositor
      target = "graphical-session.target";
      environment = [];
    };
  };
}
