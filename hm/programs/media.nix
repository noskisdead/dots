{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      modernz
      mpv-discord
      thumbfast
    ];
  };
  home.packages = with pkgs; [
    amberol
    eog
    kdePackages.okular
    ffmpeg
    yt-dlp # Video Downloader
  ];
}
