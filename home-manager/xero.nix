{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./Browsers/firefox
    ./Browsers/google-chrome.nix
    ./cli/git.nix
    ./media/mpv.nix
    ./keepass.nix
  ];
  # ++ (builtins.attrValues outputs.homeManagerModules);

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = ["nix-command" "flakes"];
      warn-dirty = false;
    };
  };

  home = {
    username = "xero";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = "24.05";
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
}
