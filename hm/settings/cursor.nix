{ pkgs, ... }:

{
  home.pointerCursor = {
    gtk.enable = true;   # GTK apps use it
    x11.enable = true;   # X11 apps use it
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };
}
