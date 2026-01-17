{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    scripts = with pkgs; [
      mpvScripts.thumbfast
      mpvScripts.modernx-zydezu
    ];
  };
  home.packages = with pkgs; [
    ani-cli
    ani-skip
    eog
    #ffmpeg
    amberol
    yt-dlp # Video Downloader
    parabolic # yt-dlp GUI
  ];
}
