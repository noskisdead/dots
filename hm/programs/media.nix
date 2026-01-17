{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    scripts = with pkgs; [
      mpvScripts.thumbfast
      mpvScripts.modernx-zydezu
    ];
  };
  home.packages = with pkgs; [
    amberol
    ani-cli
    ani-skip
    eog
    ffmpeg
    yt-dlp # Video Downloader
    parabolic # yt-dlp GUI
  ];
}
