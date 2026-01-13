{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true; # Disable and become based gng <3
  };

  # Things used in my hyprland config
  environment.systemPackages = with pkgs; [
    app2unit # for clipboards :3
    fuzzel # for clipboards :3
    glib # gsettings
    hyprpicker # color picker :3
    trash-cli # trash
  ];
}
