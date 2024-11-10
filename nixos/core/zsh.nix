{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = false;
  };

  environment.shells = [pkgs.zsh];

  users.defaultUserShell = pkgs.zsh;
}
