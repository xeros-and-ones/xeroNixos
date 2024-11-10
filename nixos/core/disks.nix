{
  services.fstrim.enable = true;
  fileSystems."/mnt/Data" = {
    device = "dev/disk/by-label/Data";
    fsType = "ntfs-3g";
  };
}
