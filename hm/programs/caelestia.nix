{inputs, ...}: {
  imports = [inputs.caelestia-shell.homeManagerModules.default];
  programs.caelestia = {
    enable = true;
    cli.enable = true;
    systemd = {
      enable = true; # if you prefer starting from your compositor
      target = "graphical-session.target";
      environment = [];
    };
  };
}
