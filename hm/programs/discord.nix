{pkgs, ...}: {
  home.packages = with pkgs; [
    (discord.override {
      withVencord = true;
      withOpenASAR = true;
    })
  ];
}
