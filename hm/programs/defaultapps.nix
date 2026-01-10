{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Common video mime types
      "video/mp4" = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop"; # For MKV files
      "video/avi" = "mpv.desktop";
      "video/webm" = "mpv.desktop";
    };
  };
}
