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
    ffmpeg
    yt-dlp # Video Downloader
  ];
}
