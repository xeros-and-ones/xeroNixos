{
  pkgs,
  config,
  ...
}: {
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [mpris uosc thumbfast];
    config = {
      force-window = true;
      geometry = "100%x100%-+0-+0";

      # no-border = true;
      save-position-on-quit = true;
      force-seekable = "yes";
      cursor-autohide = 100;

      vo = "gpu-next";
      hwdec-codecs = "all";

      # forces showing subtitles while seeking through the video
      demuxer-mkv-subtitle-preroll = "yes";

      deband = true;
      deband-grain = 0;
      deband-range = 12;
      deband-threshold = 32;

      sub-auto = "fuzzy";
      # some settings fixing VOB/PGS subtitles (creating blur & changing yellow subs to gray)
      sub-gauss = "1.0";
      sub-gray = "yes";
      sub-use-margins = "no";
      sub-font-size = 45;
      sub-scale-by-window = "yes";
      sub-scale-with-window = "no";

      screenshot-directory = "${config.xdg.userDirs.pictures}/Screenshots";

      slang = "en,eng,english";
      alang = "jp,jpn,japanese,en,eng,english";

      write-filename-in-watch-later-config = true;
    };
    bindings = {
      MBTN_LEFT = "cycle pause";
      UP = "add volume 5";
      WHEEL_UP = "add volume 5";
      DOWN = "add volume -5";
      WHEEL_DOWN = "add volume -5";
      "Ctrl+UP" = "add speed 0.1";
      "Ctrl+DOWN" = "add speed -0.1";
      PGUP = "add chapter 1"; # skip to next chapter
      PGDWN = "add chapter -1"; # skip to previous chapter
      "[" = "add speed -0.1";
      "]" = "add speed 0.1";

      I = ''cycle-values vf "sub,lavfi=negate" ""''; # invert colors

      # disable annoying defaults
      "1" = "ignore";
      "2" = "ignore";
      "3" = "ignore";
      "4" = "ignore";
      "5" = "ignore";
      "6" = "ignore";
      "7" = "ignore";
      "8" = "ignore";
      "9" = "ignore";
      "0" = "ignore";
      "/" = "ignore";
      "*" = "ignore";
      "Alt+left" = "ignore";
      "Alt+right" = "ignore";
      "Alt+up" = "ignore";
      "Alt+down" = "ignore";
    };
  };
}
