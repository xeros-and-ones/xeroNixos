{
  inputs,
  pkgs,
  ...
}: {
  programs.adb.enable = true;

  environment = {
    systemPackages = with pkgs; [
      # Media tools
      exiftool
      # network tools
      wget
      yt-dlp
      # editors
      neovim
      vscode-fhs
      kate

      (inputs.pollymc.packages.${pkgs.system}.pollymc.override {jdks = [pkgs.temurin-bin-21 pkgs.temurin-bin-8 pkgs.temurin-bin-17];})
      inputs.kwin-effects-forceblur.packages.${pkgs.system}.default

      # terminal $ mux
      kitty
      zellij
      tmux

      # cli tools
      fd
      eza
      bat
      ripgrep
      lazygit
      erdtree

      # system tools
      pciutils
      lshw
      coreutils
      glxinfo
      stow
      libva-utils
      vdpauinfo
      intel-gpu-tools
      bleachbit
      emote
      kdePackages.kcalc
      kdePackages.kamera

      # clipboard tools
      xclip
      wl-clipboard
      qbittorrent
    ];
  };
}
