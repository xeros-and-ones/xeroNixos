{
  programs.firefox = {
    enable = true;
    profiles.xero = {
      settings = {
        "browser.compactmode.show" = true;
        "browser.uidensity" = 1;
        "extensions.pocket.enabled" = false;
        "browser.toolbars.bookmarks.visibility" = "never";
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "full-screen-api.warning.timeout" = 0;
        "browser.download.useDownloadDir" = false;
        "browser.download.autohideButton" = false;
        "browser.bookmarks.openInTabClosesMenu" = false;
        "browser.tabs.loadBookmarksInBackground" = true;
        "browser.tabs.loadBookmarksInTabs" = true;
        "browser.tabs.tabMinWidth" = 120;
        "mousewheel.min_line_scroll_amount" = 100;
        "mousewheel.default.delta_multiplier_y" = 20;
        "browser.search.suggest.enabled" = true;
        "browser.search.suggest.enabled.private" = true;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.shell.skipDefaultBrowserCheckOnFirstRun" = true;
        "layout.css.prefers-color-scheme.content-override" = 0;
        "browser.download.dir" = "/mnt/Data/Downloads";
        "ui.textHighlightBackground" = "#7ac5f0";
        "ui.textHighlightForeground" = "#000000";
        "ui.textSelectAttentionBackground" = "#38d878";
        "ui.selectSelectAttentionForeground" = "#000000";
      };
      userChrome = builtins.readFile ./userChrome.css;
    };
  };
}
