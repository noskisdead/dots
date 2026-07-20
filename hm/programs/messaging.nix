{pkgs, ...}: {
  home.packages = with pkgs; [
    (discord.override {
      withOpenASAR = true;
      # withVencord = true; # can do this here too
    })
  ];
}
