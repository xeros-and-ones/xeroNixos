{pkgs, ...}: {
  # Enable the KDE Plasma Desktop Environment.
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us,ara";
        options = "grp:win_space_toggle";
      };
    };
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.defaultSession = "plasmax11";
    displayManager.sddm.autoNumlock = true;
  };
  environment.systemPackages = with pkgs; [
    kdePackages.qtstyleplugin-kvantum
    kdePackages.sddm-kcm
  ];
}
