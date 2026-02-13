{pkgs, ...}: {
  home.packages = with pkgs; [
    # cinny-desktop currently broken
    equibop
  ];
}
