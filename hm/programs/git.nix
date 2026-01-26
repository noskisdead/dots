{pkgs, ...}: {
  programs = {
    git = {
      enable = true;
      settings.user.name = "noskisdead";
      settings.user.email = "noskisdead@users.noreply.github.com";
    };
    gh.enable = true;
    gh-dash.enable = true;
  };
  home.packages = with pkgs; [github-desktop];
}
