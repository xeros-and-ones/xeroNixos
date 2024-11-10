{pkgs, ...}: {
  # Fonts are nice to have
  fonts.packages = with pkgs; [
    # Fonts
    (nerdfonts.override {fonts = ["Inconsolata" "FiraCode" "CascadiaCode" "JetBrainsMono"];})
    rubik
    powerline
    inconsolata
    font-awesome
    ubuntu_font_family
    terminus_font
  ];
}
