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
    displayManager.sddm.extraPackages = with pkgs; [sddm-chili-theme];
    displayManager.sddm.theme = "sddm-chili-theme";
  };
  environment.systemPackages = with pkgs; [
    kdePackages.qtstyleplugin-kvantum
    kdePackages.sddm-kcm
  ];
}
